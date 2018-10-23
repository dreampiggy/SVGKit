
#import "SVGSwitchElement.h"
#import "CALayerWithChildHitTest.h"
#import "SVGHelperUtilities.h"
#import "DOMNodeList+Mutable.h"

@implementation SVGSwitchElement

@synthesize visibleChildNodes = _visibleChildNodes;


- (CALayer *) newLayer
{
    CALayer* _layer = [CALayerWithChildHitTest layer];
    
    [SVGHelperUtilities configureCALayer:_layer usingElement:self];
    
    return _layer;
}

- (DOMNodeList *)visibleChildNodes
{
    if (_visibleChildNodes)
        return _visibleChildNodes;
    
    DOMNode *tempNode = [DOMNode new];
    
    NSString* localLanguage = [[NSLocale preferredLanguages] firstObject];
    
    for (int i = 0; i < self.childNodes.length; i++) {
        SVGElement<ConverterSVGToCALayer> *child = (SVGElement<ConverterSVGToCALayer> *)[self.childNodes item:i];
        if ([child conformsToProtocol:@protocol(ConverterSVGToCALayer)])
        {
            // spec says if there is no attribute at all then pick it
            if (![child hasAttribute:@"systemLanguage"])
            {
                [tempNode appendChild:child];
                break;
            }
            
            NSString* languages = [child getAttribute:@"systemLanguage"];

            NSArray* languageCodes = [languages componentsSeparatedByCharactersInSet:
                                      [NSCharacterSet characterSetWithCharactersInString:@", \t\n\r"]];

            if ([languageCodes containsObject:localLanguage])
            {
                [tempNode appendChild:child];
                break;
            }
        
        }
    }
    _visibleChildNodes = tempNode.childNodes;
    
    return _visibleChildNodes;
}

- (void)layoutLayer:(CALayer *)layer
{
    
}
@end
