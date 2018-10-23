/*
//  Document.h

 NOT a Cocoa / Apple document,
 NOT an SVG document,
 BUT INSTEAD: a DOM document (blame w3.org for the too-generic name).
 
 Required for SVG-DOM
 
 c.f.:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#i-Document
 
 interface Document : Node {
 readonly attribute DocumentType     doctype;
 readonly attribute DOMImplementation  implementation;
 readonly attribute Element          documentElement;
 Element            createElement(in DOMString tagName)
 raises(DOMException);
 DocumentFragment   createDocumentFragment();
 Text               createTextNode(in DOMString data);
 Comment            createComment(in DOMString data);
 CDATASection       createCDATASection(in DOMString data)
 raises(DOMException);
 ProcessingInstruction createProcessingInstruction(in DOMString target, 
 in DOMString data)
 raises(DOMException);
 Attr               createAttribute(in DOMString name)
 raises(DOMException);
 EntityReference    createEntityReference(in DOMString name)
 raises(DOMException);
 NodeList           getElementsByTagName(in DOMString tagname);
 // Introduced in DOM Level 2:
 Node               importNode(in Node importedNode, 
 in boolean deep)
 raises(DOMException);
 // Introduced in DOM Level 2:
 Element            createElementNS(in DOMString namespaceURI, 
 in DOMString qualifiedName)
 raises(DOMException);
 // Introduced in DOM Level 2:
 Attr               createAttributeNS(in DOMString namespaceURI, 
 in DOMString qualifiedName)
 raises(DOMException);
 // Introduced in DOM Level 2:
 NodeList           getElementsByTagNameNS(in DOMString namespaceURI, 
 in DOMString localName);
 // Introduced in DOM Level 2:
 Element            getElementById(in DOMString elementId);
 };

 
 */
#if __has_include(<WebKit/DOMDocument.h>)
#import <WebKit/DOMDocument.h>
#else

#import <Foundation/Foundation.h>

/** ObjectiveC won't allow this: @class Node; */
#import "DOMNode.h"
@class DOMElement;
#import "DOMElement.h"
@class DOMComment;
#import "DOMComment.h"
@class DOMCDATASection;
#import "DOMCDATASection.h"
@class DOMDocumentFragment;
#import "DOMDocumentFragment.h"
@class DOMEntityReference;
#import "DOMEntityReference.h"
@class DOMNodeList;
#import "DOMNodeList.h"
@class DOMProcessingInstruction;
#import "DOMProcessingInstruction.h"
@class DOMDocumentType;
#import "DOMDocumentType.h"

@interface DOMDocument : DOMNode

@property(nonatomic,strong,readonly) DOMDocumentType*     doctype;
@property(nonatomic,strong,readonly) DOMElement*          documentElement;


-(DOMElement*) createElement:(NSString*) tagName __attribute__((ns_returns_retained));
-(DOMDocumentFragment*) createDocumentFragment __attribute__((ns_returns_retained));
-(DOMText*) createTextNode:(NSString*) data __attribute__((ns_returns_retained));
-(DOMComment*) createComment:(NSString*) data __attribute__((ns_returns_retained));
-(DOMCDATASection*) createCDATASection:(NSString*) data __attribute__((ns_returns_retained));
-(DOMProcessingInstruction*) createProcessingInstruction:(NSString*) target data:(NSString*) data __attribute__((ns_returns_retained));
-(DOMAttr*) createAttribute:(NSString*) data __attribute__((ns_returns_retained));
-(DOMEntityReference*) createEntityReference:(NSString*) data __attribute__((ns_returns_retained));

-(DOMNodeList*) getElementsByTagName:(NSString*) data;

// Introduced in DOM Level 2:
-(DOMNode*) importNode:(DOMNode*) importedNode deep:(BOOL) deep;

// Introduced in DOM Level 2:
-(DOMElement*) createElementNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName __attribute__((ns_returns_retained));

// Introduced in DOM Level 2:
-(DOMAttr*) createAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName;

// Introduced in DOM Level 2:
-(DOMNodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName;

// Introduced in DOM Level 2:
-(DOMElement*) getElementById:(NSString*) elementId;

@end

#endif
