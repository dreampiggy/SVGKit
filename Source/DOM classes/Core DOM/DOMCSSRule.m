#if __has_include(<WebKit/DOMCSSRule.h>)
#import <WebKit/DOMCSSRule.h>
#else

#import "DOMCSSRule.h"

@implementation DOMCSSRule

@synthesize type;
@synthesize cssText;

@synthesize parentStyleSheet;
@synthesize parentRule;


@end

#endif
