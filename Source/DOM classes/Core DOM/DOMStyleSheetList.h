/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/stylesheets.html#StyleSheets-StyleSheetList
 
 interface StyleSheetList {
 readonly attribute unsigned long    length;
 StyleSheet         item(in unsigned long index);
 */
#if __has_include(<WebKit/DOMStyleSheetList.h>)
#import <WebKit/DOMStyleSheetList.h>
#else

#import <Foundation/Foundation.h>

#import "DOMStyleSheet.h"

@interface DOMStyleSheetList : NSObject

@property(nonatomic,readonly) unsigned long length;

-(DOMStyleSheet*) item:(unsigned long) index;

@end

#endif
