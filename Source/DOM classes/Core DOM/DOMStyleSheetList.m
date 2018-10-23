#if __has_include(<WebKit/DOMStyleSheetList.h>)
#import <WebKit/DOMStyleSheetList.h>
#else

#import "DOMStyleSheetList.h"
#import "DOMStyleSheetList+Mutable.h"

@implementation DOMStyleSheetList

@synthesize internalArray;

- (id)init
{
    self = [super init];
    if (self) {
        self.internalArray = [NSMutableArray array];
    }
    return self;
}


-(unsigned long)length
{
	return self.internalArray.count;
}

-(DOMStyleSheet*) item:(unsigned long) index
{
	return [self.internalArray objectAtIndex:index];
}

@end

#endif
