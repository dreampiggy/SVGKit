/*
 SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-1004215813
 
 interface ProcessingInstruction : Node {
 readonly attribute DOMString        target;
 attribute DOMString        data;
 // raises(DOMException) on setting
 
 };
*/
#if __has_include(<WebKit/DOMProcessingInstruction.h>)
#import <WebKit/DOMProcessingInstruction.h>
#else

#import <Foundation/Foundation.h>

/** objc won't allow this: @class Node;*/
#import "DOMNode.h"

@interface DOMProcessingInstruction : DOMNode
@property(nonatomic,strong,readonly) NSString* target;
@property(nonatomic,strong,readonly) NSString* data;

-(id) initProcessingInstruction:(NSString*) target value:(NSString*) data;

@end

#endif
