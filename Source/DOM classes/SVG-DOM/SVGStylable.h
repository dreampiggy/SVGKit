/**
 http://www.w3.org/TR/SVG/types.html#InterfaceSVGStylable
 
 interface SVGStylable {
 
 readonly attribute SVGAnimatedString className;
 readonly attribute CSSStyleDeclaration style;
 
 CSSValue getPresentationAttribute(in DOMString name);
 */
#import <Foundation/Foundation.h>

#import "DOMCSSStyleDeclaration.h"
#import "DOMCSSValue.h"

@protocol SVGStylable <NSObject>

@property(nonatomic,retain) /*FIXME: should be of type: SVGAnimatedString */ NSString* className;
@property(nonatomic,retain)	DOMCSSStyleDeclaration* style;

-(DOMCSSValue*) getPresentationAttribute:(NSString*) name;

@end
