#if __has_include(<WebKit/DOMMediaList.h>)
#import <WebKit/DOMMediaList.h>
#else

#import "DOMMediaList.h"

@implementation DOMMediaList

@synthesize mediaText;
@synthesize length;


-(NSString*) item:(unsigned long) index
{
	NSAssert( FALSE, @"Not implemented yet");
	return nil;
}
-(void) deleteMedium:(NSString*) oldMedium
{
	NSAssert( FALSE, @"Not implemented yet");
}
-(void) appendMedium:(NSString*) newMedium
{
	NSAssert( FALSE, @"Not implemented yet");
}

@end

#endif
