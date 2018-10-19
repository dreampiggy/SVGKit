//
//  SVGGradientLayer.m
//  SVGKit-iOS
//
//  Created by zhen ling tsai on 19/7/13.
//  Copyright (c) 2013 na. All rights reserved.
//

#import "SVGGradientLayer.h"
#import "SVGRadialGradientElement.h"
#import "SVGLinearGradientElement.h"
#import "CALayerWithClipRender.h"
#if SVGKIT_MAC
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

@implementation SVGGradientLayer

- (void)renderInContext:(CGContextRef)ctx {
    if (!self.gradientElement) {
        [super renderInContext:ctx];
        return;
    }
    if ([self.gradientElement isKindOfClass:[SVGRadialGradientElement class]]) {
        [self renderRadialGradientInContext:ctx];
    } else if ([self.gradientElement isKindOfClass:[SVGLinearGradientElement class]]) {
        [self renderLinearGradientInContext:ctx];
    }
}

- (CGGradientRef)createCGGradient {
    SVGGradientElement *gradientElement = self.gradientElement;
    if ([gradientElement isKindOfClass:[SVGRadialGradientElement class]]) {
        SVGLength *svgR = ((SVGRadialGradientElement *)gradientElement).r;
        if (svgR.value <= 0) {
            return nil;
        }
    }
    // CGGradient
    NSArray *colors = gradientElement.colors;
    NSArray *locations = gradientElement.locations;
    if (colors.count == 0) {
        SVGKitLogWarn(@"[%@] colors count is zero", [self class]);
        return NULL;
    }
    if (colors.count != locations.count) {
        SVGKitLogWarn(@"[%@] colors count : %lu != locations count : %lu", [self class], (unsigned long)colors.count, (unsigned long)locations.count);
        return NULL;
    }
    CGFloat locations_array[locations.count];
    CGColorSpaceRef colorSpace = NULL;
    for (int i = 0; i < locations.count; i++) {
        CGFloat location = [[locations objectAtIndex:i] doubleValue];
        CGColorRef colorRef = (__bridge CGColorRef)[colors objectAtIndex:i];
        locations_array[i] = location;
        if (!colorSpace) {
            colorSpace = CGColorGetColorSpace(colorRef);
        }
    }
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations_array);
    CGColorSpaceRelease(colorSpace);
    
    return gradient;
}

- (void)renderLinearGradientInContext:(CGContextRef)ctx {
    SVGLinearGradientElement *gradientElement = (SVGLinearGradientElement *)self.gradientElement;
    BOOL inUserSpace = gradientElement.gradientUnits == SVG_UNIT_TYPE_USERSPACEONUSE;
    CGRect objectRect = self.objectRect;
//    CGRect rectForRelativeUnits = inUserSpace ? CGRectFromSVGRect( self.viewportRect ) : objectRect;
    
    CGPoint gradientStartPoint = CGPointZero;
    CGPoint gradientEndPoint = CGPointZero;
    
    // transforms
    CGAffineTransform selfTransform = gradientElement.transform;
    CGAffineTransform absoluteTransform = self.absoluteTransform;
    
    // CGGradient
    CGGradientRef gradient = [self createCGGradient];
    
#pragma mark User Space On Use
    CGContextSaveGState(ctx);
    {
        // clip the mask
        if (self.mask)
        {
            [CALayerWithClipRender maskLayer:self inContext:ctx];
        }
        if(inUserSpace == YES) {
            gradientStartPoint = CGPointMake([gradientElement.x1 pixelsValueWithDimension:1.0],
                                             [gradientElement.y1 pixelsValueWithDimension:1.0]);
            
            gradientEndPoint = CGPointMake([gradientElement.x2 pixelsValueWithDimension:1.0],
                                           [gradientElement.y2 pixelsValueWithDimension:1.0]);
            
            // transform absolute - due to user space
            CGContextConcatCTM(ctx, absoluteTransform);
        } else {
#pragma mark Object Bounding Box
            CGFloat width = CGRectGetWidth(objectRect);
            CGFloat height = CGRectGetHeight(objectRect);
            gradientStartPoint = CGPointMake([gradientElement.x1 pixelsValueWithDimension:width],
                                             [gradientElement.y1 pixelsValueWithDimension:height]);
            
            gradientEndPoint = CGPointMake([gradientElement.x2 pixelsValueWithDimension:width],
                                           [gradientElement.y2 pixelsValueWithDimension:height]);
        }
        
        // set the opacity
        CGContextSetAlpha(ctx, self.opacity);
        
        // transform the context
        CGContextConcatCTM(ctx, selfTransform);
        
        // draw the gradient
        CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation|
        kCGGradientDrawsAfterEndLocation;
        
        CGContextDrawLinearGradient(ctx, gradient, gradientStartPoint,
                                    gradientEndPoint, options);
        CGGradientRelease(gradient);
    };
    CGContextRestoreGState(ctx);
}

-(void)renderRadialGradientInContext:(CGContextRef)ctx {
    SVGRadialGradientElement *gradientElement = (SVGRadialGradientElement *)self.gradientElement;
    BOOL inUserSpace = gradientElement.gradientUnits == SVG_UNIT_TYPE_USERSPACEONUSE;
    CGRect objectRect = self.objectRect;
//    CGRect rectForRelativeUnits = inUserSpace ? CGRectFromSVGRect( self.viewportRect ) : objectRect;
    
    CGFloat radius;
    CGFloat focalRadius;
    CGPoint startPoint = CGPointZero;
    CGPoint gradientStartPoint = CGPointZero;
    CGPoint gradientEndPoint = CGPointZero;
    
    // transforms
    CGAffineTransform selfTransform = gradientElement.transform;
    CGAffineTransform absoluteTransform = self.absoluteTransform;
    
    // CGGradient
    CGGradientRef gradient = [self createCGGradient];
    
    CGContextSaveGState(ctx);
    {
        // clip the mask
        if (self.mask)
        {
            [CALayerWithClipRender maskLayer:self inContext:ctx];
        }
#pragma mark User Space On Use
        if(inUserSpace == YES) {
            radius = [gradientElement.r pixelsValueWithDimension:1.0];
            focalRadius = [gradientElement.fr pixelsValueWithDimension:1.0];
            CGFloat rad = radius*2.f;
            startPoint = CGPointMake([gradientElement.cx pixelsValueWithDimension:1.0], [gradientElement.cy pixelsValueWithDimension:1.0]);
            
            // work out the new radius
            CGRect rect = CGRectMake(startPoint.x, startPoint.y, rad, rad);
            rect = CGRectApplyAffineTransform(rect, selfTransform);
            rect = CGRectApplyAffineTransform(rect, absoluteTransform);
            radius = CGRectGetHeight(rect)/2.f;
            
            gradientStartPoint = startPoint;
            gradientEndPoint = CGPointMake([gradientElement.fx pixelsValueWithDimension:1.0], [gradientElement.fy pixelsValueWithDimension:1.0]);
            
            // apply the absolute position
            CGContextConcatCTM(ctx, absoluteTransform);
        } else {
#pragma mark Object Bounding Box
            // compute size based on percentages
            CGFloat x = [gradientElement.cx pixelsValueWithDimension:CGRectGetWidth(objectRect)];
            CGFloat y = [gradientElement.cy pixelsValueWithDimension:CGRectGetHeight(objectRect)];
            startPoint = CGPointMake(x, y);
            CGFloat val = MIN(CGRectGetWidth(objectRect), CGRectGetHeight(objectRect));
            radius = [gradientElement.r pixelsValueWithDimension:val];
            focalRadius = [gradientElement.fr pixelsValueWithDimension:val];
            
            CGFloat ex = [gradientElement.fx pixelsValueWithDimension:CGRectGetWidth(objectRect)];
            CGFloat ey = [gradientElement.fy pixelsValueWithDimension:CGRectGetHeight(objectRect)];
            
            gradientEndPoint = CGPointMake(ex, ey);
            gradientStartPoint = startPoint;
            
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
        
        // set the opacity
        CGContextSetAlpha(ctx, self.opacity);
        
#pragma mark Default drawing
        // transform the context
        CGContextConcatCTM(ctx, selfTransform);
        
        if (gradient) {
            // draw the gradient
            CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation|
            kCGGradientDrawsAfterEndLocation;
            CGContextDrawRadialGradient(ctx, gradient,
                                        gradientEndPoint, focalRadius, gradientStartPoint,
                                        radius, options);
            CGGradientRelease(gradient);
        } else {
            // draw the background
            CGColorRef backgroundColor = self.backgroundColor;
            CGContextSetFillColorWithColor(ctx, backgroundColor);
            CGContextFillRect(ctx, CGRectMake(0, 0, CGRectGetWidth(objectRect), CGRectGetHeight(objectRect)));
        }
    };
    CGContextRestoreGState(ctx);
}

@end
