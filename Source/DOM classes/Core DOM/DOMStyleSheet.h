/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/stylesheets.html#StyleSheets-StyleSheet
 
 interface StyleSheet {
 readonly attribute DOMString        type;
 attribute boolean          disabled;
 readonly attribute Node             ownerNode;
 readonly attribute StyleSheet       parentStyleSheet;
 readonly attribute DOMString        href;
 readonly attribute DOMString        title;
 readonly attribute MediaList        media;
 */
#if __has_include(<WebKit/DOMStyleSheet.h>)
#import <WebKit/DOMStyleSheet.h>
#else

#import <Foundation/Foundation.h>

@class DOMNode;
@class DOMMediaList;

@interface DOMStyleSheet : NSObject

@property(nonatomic,strong) NSString* type;
@property(nonatomic) BOOL disabled;
@property(nonatomic,strong) DOMNode* ownerNode;
@property(nonatomic,strong) DOMStyleSheet* parentStyleSheet;
@property(nonatomic,strong) NSString* href;
@property(nonatomic,strong) NSString* title;
@property(nonatomic,strong) DOMMediaList* media;

@end

#endif
