#if __has_include(<WebKit/DOMDocument.h>)
#import <WebKit/DOMDocument.h>
#else

#import "DOMDocument.h"

@interface DOMDocument ()

@property(nonatomic,strong,readwrite) DOMElement*          documentElement;

@end

#endif
