 /* FIXME: very different from SVG Spec */

#import "SVGGradientElement.h"
#import "SVGGradientStop.h"
#import "SVGGElement.h"
#import "SVGLinearGradientElement.h"
#import "SVGRadialGradientElement.h"
#if SVGKIT_MAC
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

@implementation SVGGradientElement

@synthesize stops = _stops;
@synthesize transform;
@synthesize locations = _locations;
@synthesize colors = _colors;

-(void)addStop:(SVGGradientStop *)gradientStop
{
    if( _stops == nil )
	{
		_stops = [NSArray arrayWithObject:gradientStop];
	}
	else
	{
		_stops = [_stops arrayByAddingObjectsFromArray:[NSArray arrayWithObject:gradientStop]];
	}
}

- (NSArray *)colors {
    if(_colors == nil ) //these can't be determined until parsing is complete, need to update SVGGradientParser and do this on end element
    {
        //        CGColorRef theColor = NULL;//, alphaColor = NULL;
        NSUInteger numStops = [self.stops count];
        if (numStops == 0) {
            return nil;
        }
        NSMutableArray *colorBuilder = [[NSMutableArray alloc] initWithCapacity:numStops];
//        NSMutableArray *locationBuilder = [[NSMutableArray alloc] initWithCapacity:numStops];
        for (SVGGradientStop *theStop in self.stops)
        {
//            [locationBuilder addObject:[NSNumber numberWithFloat:theStop.offset]];
            //            theColor = CGColorWithSVGColor([theStop stopColor]);
            //        alphaColor = CGColorCreateCopyWithAlpha(theColor, [theStop stopOpacity]);
            [colorBuilder addObject:(__bridge id)CGColorWithSVGColor([theStop stopColor])];
            //        CGColorRelease(alphaColor);
        }
        
        _colors = [[NSArray alloc] initWithArray:colorBuilder];
    }
    return _colors;
}

- (NSArray *)locations {
    if(_locations == nil ) //these can't be determined until parsing is complete, need to update SVGGradientParser and do this on end element
    {
        //        CGColorRef theColor = NULL;//, alphaColor = NULL;
        NSUInteger numStops = [self.stops count];
        if (numStops == 0) {
            return nil;
        }
//        NSMutableArray *colorBuilder = [[NSMutableArray alloc] initWithCapacity:numStops];
        NSMutableArray *locationBuilder = [[NSMutableArray alloc] initWithCapacity:numStops];
        for (SVGGradientStop *theStop in self.stops)
        {
            [locationBuilder addObject:[NSNumber numberWithFloat:theStop.offset]];
            //            theColor = CGColorWithSVGColor([theStop stopColor]);
            //        alphaColor = CGColorCreateCopyWithAlpha(theColor, [theStop stopOpacity]);
//            [colorBuilder addObject:(__bridge id)CGColorWithSVGColor([theStop stopColor])];
            //        CGColorRelease(alphaColor);
        }
        
        _locations = [[NSArray alloc] initWithArray:locationBuilder];
    }
    return _locations;
}

-(void)postProcessAttributesAddingErrorsTo:(SVGKParseResult *)parseResult
{
    [super postProcessAttributesAddingErrorsTo:parseResult];
}

-(NSString*) getAttributeInheritedIfNil:(NSString*) attrName
{
	if( [self.parentNode isKindOfClass:[SVGGElement class]] )
		return [self hasAttribute:attrName] ? [self getAttribute:attrName] : [((SVGElement*)self.parentNode) getAttribute:attrName];
	else
		return [self getAttribute:attrName]; // will return blank if there was no value AND no parent value
}

-(CGPoint) normalizeGradientCoordinate:(SVGLength*) x y:(SVGLength*) y rectToFill:(CGRect) rectToFill
{
	CGFloat xNormalized, yNormalized;
	
	if( x.value == 0 )
		xNormalized = 0;
	else
	switch( x.unitType )  // SVG needs gradients measured in percent...
	{
		case SVG_LENGTHTYPE_PERCENTAGE:
		{
			 xNormalized = [x numberValue]; // will convert the percent into [0,1]
		}break;
			
		case SVG_LENGTHTYPE_NUMBER:
		case SVG_LENGTHTYPE_PX:
		{
			xNormalized = (([x pixelsValue] - rectToFill.origin.x) / rectToFill.size.width);
		} break;
			
		default:
		{
			NSAssert( FALSE, @"Unsupported input units in the SVGLength variable passed in for 'x': %i", x.unitType );
			xNormalized = 0;
		}
	}
	
	if( y.value == 0 )
		yNormalized = 0;
	else
	switch( y.unitType )  // SVG needs gradients measured in percent...
	{
		case SVG_LENGTHTYPE_PERCENTAGE:
		{
			yNormalized = [y numberValue]; // will convert the percent into [0,1]
		}break;
			
		case SVG_LENGTHTYPE_NUMBER:
		case SVG_LENGTHTYPE_PX:
		{
			yNormalized = (([y pixelsValue] - rectToFill.origin.y) / rectToFill.size.height);
		}break;
			
		default:
		{
			NSAssert( FALSE, @"Unsupported input units in the SVGLength variable passed in for 'y': %i", y.unitType );
			yNormalized = 0;
		}
	}
	
	return CGPointMake( xNormalized, yNormalized );
}

- (CAGradientLayer *)newGradientLayerForObjectRect:(CGRect)objectRect viewportRect:(SVGRect)viewportRect transform:(CGAffineTransform)transform {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)synthesizeProperties
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)layoutLayer:(CALayer *)layer
{
	
}


@end
