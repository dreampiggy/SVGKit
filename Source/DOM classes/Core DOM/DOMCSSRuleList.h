/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-CSSRuleList
 
 interface CSSRuleList {
 readonly attribute unsigned long    length;
 CSSRule            item(in unsigned long index);
 */
#if __has_include(<WebKit/DOMCSSRuleList.h>)
#import <WebKit/DOMCSSRuleList.h>
#else

#import <Foundation/Foundation.h>

#import "DOMCSSRule.h"

@interface DOMCSSRuleList : NSObject

@property(nonatomic,readonly) unsigned long length;

-(DOMCSSRule*) item:(unsigned long) index;

@end

#endif
