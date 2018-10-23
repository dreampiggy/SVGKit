#if __has_include(<WebKit/DOMCSSPrimitiveValue.h>)
#import <WebKit/DOMCSSPrimitiveValue.h>
#else

#import "DOMCSSPrimitiveValue.h"

@interface DOMCSSPrimitiveValue ()

@property(nonatomic) float pixelsPerInch;

@end

#endif
