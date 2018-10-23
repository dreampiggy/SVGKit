/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-11C98490
 
 interface EntityReference : Node {
 };
 */
#if __has_include(<WebKit/DOMEntityReference.h>)
#import <WebKit/DOMEntityReference.h>
#else

#import <Foundation/Foundation.h>

/** objc won't allow this: @class Node; */
#import "DOMNode.h"

@interface DOMEntityReference : DOMNode

@end

#endif
