#if __has_include(<WebKit/DOMCSSRuleList.h>)
#import <WebKit/DOMCSSRuleList.h>
#else

#import "DOMCSSRuleList.h"
#import "DOMCSSRuleList+Mutable.h"

@implementation DOMCSSRuleList

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

-(DOMCSSRule *)item:(unsigned long)index
{
	return [self.internalArray objectAtIndex:index];
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"CSSRuleList: array(%@)", self.internalArray];
}

@end

#endif
