/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-DocumentCSS
 
 interface DocumentCSS : stylesheets::DocumentStyle {
 CSSStyleDeclaration getOverrideStyle(in Element elt,
 in DOMString pseudoElt);
 */
#import <Foundation/Foundation.h>
#import "DOMDocumentStyle.h"

#import "DOMCSSStyleDeclaration.h"

@class DOMElement;

@protocol DOMDocumentCSS <DOMDocumentStyle>

-(DOMCSSStyleDeclaration *)getOverrideStyle:(DOMElement *)element pseudoElt:(NSString *)pseudoElt;

@end
