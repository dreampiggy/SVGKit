/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-CSSValueList
 
 interface CSSValueList : CSSValue {
 readonly attribute unsigned long    length;
 CSSValue           item(in unsigned long index);
 */
#if __has_include(<WebKit/DOMCSSValueList.h>)
#import <WebKit/DOMCSSValueList.h>
#else

#import "DOMCSSValue.h"

@interface DOMCSSValueList : DOMCSSValue

@property(nonatomic,readonly) unsigned long length;

-(DOMCSSValue*) item:(unsigned long) index;

@end

#endif
