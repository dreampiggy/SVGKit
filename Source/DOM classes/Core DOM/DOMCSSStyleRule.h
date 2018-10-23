/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-CSSStyleRule
 
 interface CSSStyleRule : CSSRule {
 attribute DOMString        selectorText;
 // raises(DOMException) on setting
 
 readonly attribute CSSStyleDeclaration  style;
 */
#if __has_include(<WebKit/DOMCSSStyleRule.h>)
#import <WebKit/DOMCSSStyleRule.h>
#else

#import <Foundation/Foundation.h>

#import "DOMCSSRule.h"
#import "DOMCSSStyleDeclaration.h"

@interface DOMCSSStyleRule : DOMCSSRule

@property(nonatomic,strong) NSString* selectorText;
@property(nonatomic,strong) DOMCSSStyleDeclaration* style;

#pragma mark - methods needed for ObjectiveC implementation

- (id)initWithSelectorText:(NSString*) selector styleText:(NSString*) styleText;

@end

#endif
