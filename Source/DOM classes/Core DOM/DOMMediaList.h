/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/stylesheets.html#StyleSheets-MediaList
 
 interface MediaList {
 attribute DOMString        mediaText;
 // raises(DOMException) on setting
 
 readonly attribute unsigned long    length;
 DOMString          item(in unsigned long index);
 void               deleteMedium(in DOMString oldMedium)
 raises(DOMException);
 void               appendMedium(in DOMString newMedium)
 raises(DOMException);
*/
#if __has_include(<WebKit/DOMMediaList.h>)
#import <WebKit/DOMMediaList.h>
#else

#import <Foundation/Foundation.h>

@interface DOMMediaList : NSObject

@property(nonatomic,strong) NSString* mediaText;
@property(nonatomic) unsigned long length;

-(NSString*) item:(unsigned long) index;
-(void) deleteMedium:(NSString*) oldMedium;
-(void) appendMedium:(NSString*) newMedium;
	
@end

#endif
