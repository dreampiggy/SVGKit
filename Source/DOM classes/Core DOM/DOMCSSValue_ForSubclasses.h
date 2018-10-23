#if __has_include(<WebKit/DOMCSSValue.h>)
#import <WebKit/DOMCSSValue.h>
#else

#import <Foundation/Foundation.h>

@interface DOMCSSValue()

- (id)initWithUnitType:(CSSUnitType) t;

@end

#endif
