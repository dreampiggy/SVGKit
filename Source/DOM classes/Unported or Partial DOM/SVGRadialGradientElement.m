//
//  SVGRadialGradientElement.m
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/15.
//  Copyright © 2018年 na. All rights reserved.
//

#import "SVGRadialGradientElement.h"
#import "SVGElement_ForParser.h"
#import "SVGUtils.h"
#import "CALayer+Private.h"

@interface SVGRadialGradientElement ()

@property (nonatomic) BOOL hasSynthesizedProperties;

@end

@implementation SVGRadialGradientElement

- (CAGradientLayer *)newGradientLayerForObjectRect:(CGRect)objectRect viewportRect:(SVGRect)viewportRect transform:(CGAffineTransform)absoluteTransform {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    BOOL inUserSpace = NO;
    
    CGAffineTransform selfTransform = self.transform;
    CGRect rectForRelativeUnits;
    NSString* gradientUnits = [self getAttributeInheritedIfNil:@"gradientUnits"];
    if( ![gradientUnits length]
       || [gradientUnits isEqualToString:@"objectBoundingBox"])
        rectForRelativeUnits = objectRect;
    else
    {
        inUserSpace = YES;
        rectForRelativeUnits = CGRectFromSVGRect( viewportRect );
    }
    
    gradientLayer.frame = objectRect;
    
    NSString *cxAttr = [self getAttributeInheritedIfNil:@"cx"];
    NSString *cyAttr = [self getAttributeInheritedIfNil:@"cy"];
    NSString *rAttr = [self getAttributeInheritedIfNil:@"r"];
    NSString *fxAttr = [self getAttributeInheritedIfNil:@"fx"];
    NSString *fyAttr = [self getAttributeInheritedIfNil:@"fy"];
    NSString *frAttr = [self getAttributeInheritedIfNil:@"fr"];
    SVGLength* svgCX = [SVGLength svgLengthFromNSString:cxAttr.length > 0 ? cxAttr : @"50%"];
    SVGLength* svgCY = [SVGLength svgLengthFromNSString:cyAttr.length > 0 ? cyAttr : @"50%"];
    SVGLength* svgR = [SVGLength svgLengthFromNSString:rAttr.length > 0 ? rAttr : @"50%"];
    SVGLength* svgFX = [SVGLength svgLengthFromNSString:fxAttr.length > 0 ? fxAttr : cxAttr];
    SVGLength* svgFY = [SVGLength svgLengthFromNSString:fyAttr.length > 0 ? fyAttr : cyAttr];
    SVGLength* svgFR = [SVGLength svgLengthFromNSString:frAttr.length > 0 ? frAttr : rAttr];
    
    CGFloat radius = svgR.value;
    CGPoint startPoint = CGPointZero;
    CGPoint gradientStartPoint = CGPointZero;
    CGPoint gradientEndPoint = CGPointZero;
    
    if (!inUserSpace)
    {
        // compute size based on percentages
        CGFloat x = [svgCX pixelsValueWithDimension:1.0]*CGRectGetWidth(objectRect);
        CGFloat y = [svgCY pixelsValueWithDimension:1.0]*CGRectGetHeight(objectRect);
        startPoint = CGPointMake(x, y);
        CGFloat val = MIN(CGRectGetWidth(objectRect), CGRectGetHeight(objectRect));
        radius = [svgR pixelsValueWithDimension:1.0]*val;
        
        CGFloat ex = [svgFX pixelsValueWithDimension:1.0]*CGRectGetWidth(objectRect);
        CGFloat ey = [svgFY pixelsValueWithDimension:1.0]*CGRectGetHeight(objectRect);
        
        gradientEndPoint = CGPointMake(ex, ey);
        gradientStartPoint = startPoint;
    }
    else
    {
        CGFloat rad = radius*2.f;
        startPoint = CGPointMake(svgCX.value, svgCY.value);
        
        // work out the new radius
        CGRect rect = CGRectMake(startPoint.x, startPoint.y, rad, rad);
        rect = CGRectApplyAffineTransform(rect, selfTransform);
        rect = CGRectApplyAffineTransform(rect, absoluteTransform);
        radius = CGRectGetHeight(rect)/2.f;
        gradientStartPoint = startPoint;
        gradientEndPoint = CGPointMake(svgFX.value, svgFY.value);
    }
    
    if (inUserSpace)
    {
        // apply the absolute position
        gradientStartPoint = CGPointApplyAffineTransform(gradientStartPoint, absoluteTransform);
        gradientEndPoint = CGPointApplyAffineTransform(gradientEndPoint, absoluteTransform);
    }
    else
    {
        // transform if width or height is not equal
        if(CGRectGetWidth(objectRect) != CGRectGetHeight(objectRect)) {
            CGAffineTransform tr = CGAffineTransformMakeTranslation(gradientStartPoint.x,
                                                                    gradientStartPoint.y);
            if(CGRectGetWidth(objectRect) > CGRectGetHeight(objectRect)) {
                tr = CGAffineTransformScale(tr, CGRectGetWidth(objectRect)/CGRectGetHeight(objectRect), 1);
            } else {
                tr = CGAffineTransformScale(tr, 1.f, CGRectGetHeight(objectRect)/CGRectGetWidth(objectRect));
            }
            tr = CGAffineTransformTranslate(tr, -gradientStartPoint.x, -gradientStartPoint.y);
            selfTransform = CGAffineTransformConcat(tr, selfTransform);
        }
    }
    
    gradientLayer.startPoint = CGPointMake(gradientStartPoint.x / CGRectGetWidth(objectRect), gradientStartPoint.y / CGRectGetHeight(objectRect));
    gradientLayer.endPoint = CGPointMake((gradientStartPoint.x + radius) / CGRectGetWidth(objectRect), (gradientStartPoint.y + radius) / CGRectGetHeight(objectRect));
    gradientLayer.type = kCAGradientLayerRadial;
    
    if (svgR.value <= 0) { // use raw value to avoid float->double losing precision
        //  <r> A value of lower or equal to zero will cause the area to be painted as a single color using the color and opacity of the last gradient <stop>.
        SVGGradientStop *lastStop = self.stops.lastObject;
        gradientLayer.backgroundColor = CGColorWithSVGColor(lastStop.stopColor);
        gradientLayer.opacity = lastStop.stopOpacity;
    } else {
        [gradientLayer setColors:self.colors];
        [gradientLayer setLocations:self.locations];
    }
    
    SVGKitLogVerbose(@"[%@] set gradient layer start = %@", [self class], NSStringFromCGPoint(gradientLayer.startPoint));
    SVGKitLogVerbose(@"[%@] set gradient layer end = %@", [self class], NSStringFromCGPoint(gradientLayer.endPoint));
    SVGKitLogVerbose(@"[%@] set gradient layer colors = %@", [self class], self.colors);
    SVGKitLogVerbose(@"[%@] set gradient layer locations = %@", [self class], self.locations);
    
    return gradientLayer;
}

- (void)synthesizeProperties {
    if (self.hasSynthesizedProperties)
        return;
    self.hasSynthesizedProperties = YES;
    
    NSString* gradientID = [self getAttributeNS:@"http://www.w3.org/1999/xlink" localName:@"href"];
    
    if ([gradientID length])
    {
        if ([gradientID hasPrefix:@"#"])
            gradientID = [gradientID substringFromIndex:1];
        
        SVGRadialGradientElement* baseGradient = (SVGRadialGradientElement*) [self.rootOfCurrentDocumentFragment getElementById:gradientID];
        NSString* svgNamespace = @"http://www.w3.org/2000/svg";
        
        if (baseGradient)
        {
            [baseGradient synthesizeProperties];
            
            if (!self.stops && baseGradient.stops)
            {
                for (SVGGradientStop* stop in baseGradient.stops)
                    [self addStop:stop];
            }
            NSArray *keys = [NSArray arrayWithObjects:@"cx", @"cy", @"r", @"fx", @"fy", @"fr", @"gradientUnits", @"gradientTransform", nil];
            
            for (NSString* key in keys)
            {
                if (![self hasAttribute:key] && [baseGradient hasAttribute:key])
                    [self setAttributeNS:svgNamespace qualifiedName:key value:[baseGradient getAttribute:key]];
            }
            
        }
    }
}

@end
