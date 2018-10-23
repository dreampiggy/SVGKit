#if __has_include(<WebKit/DOMStyleSheetList.h>)
#import <WebKit/DOMStyleSheetList.h>
#else

#import "DOMStyleSheetList.h"

@interface DOMStyleSheetList()
@property(nonatomic,strong) NSMutableArray* internalArray;
@end

#endif
