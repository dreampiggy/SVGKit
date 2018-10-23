/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-412266927
 
 interface DocumentType : Node {
 readonly attribute DOMString        name;
 readonly attribute NamedNodeMap     entities;
 readonly attribute NamedNodeMap     notations;
 // Introduced in DOM Level 2:
 readonly attribute DOMString        publicId;
 // Introduced in DOM Level 2:
 readonly attribute DOMString        systemId;
 // Introduced in DOM Level 2:
 readonly attribute DOMString        internalSubset;
 };
*/
#if __has_include(<WebKit/DOMDocumentType.h>)
#import <WebKit/DOMDocumentType.h>
#else

#import <Foundation/Foundation.h>

#import "DOMNode.h"
#import "DOMNamedNodeMap.h"

@interface DOMDocumentType : DOMNode

@property(nonatomic,strong,readonly) NSString* name;
@property(nonatomic,strong,readonly) DOMNamedNodeMap* entities;
@property(nonatomic,strong,readonly) DOMNamedNodeMap* notations;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readonly) NSString* publicId;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readonly) NSString* systemId;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readonly) NSString* internalSubset;


@end

#endif
