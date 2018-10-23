#if __has_include(<WebKit/DOMDocument.h>)
#import <WebKit/DOMDocument.h>
#else

#import "DOMDocument.h"
#import "DOMDocument+Mutable.h"

#import "DOMHelperUtilities.h"

#import "DOMNodeList+Mutable.h" // needed for access to underlying array, because SVG doesnt specify how lists are made mutable

@implementation DOMDocument

@synthesize doctype;
@synthesize documentElement;



-(DOMElement*) createElement:(NSString*) tagName
{
	DOMElement* newElement = [[DOMElement alloc] initWithLocalName:tagName attributes:nil];
	
	SVGKitLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

-(DOMDocumentFragment*) createDocumentFragment
{
	return [[DOMDocumentFragment alloc] init];
}

-(DOMText*) createTextNode:(NSString*) data
{
	return [[DOMText alloc] initWithValue:data];
}

-(DOMComment*) createComment:(NSString*) data
{
	return [[DOMComment alloc] initWithValue:data];
}

-(DOMCDATASection*) createCDATASection:(NSString*) data
{
	return [[DOMCDATASection alloc] initWithValue:data];
}

-(DOMProcessingInstruction*) createProcessingInstruction:(NSString*) target data:(NSString*) data
{
	return [[DOMProcessingInstruction alloc] initProcessingInstruction:target value:data];
}

-(DOMAttr*) createAttribute:(NSString*) n
{
	return [[DOMAttr alloc] initWithName:n value:@""];
}

-(DOMEntityReference*) createEntityReference:(NSString*) data
{
	NSAssert( FALSE, @"Not implemented. According to spec: Creates an EntityReference object. In addition, if the referenced entity is known, the child list of the EntityReference  node is made the same as that of the corresponding Entity  node. Note: If any descendant of the Entity node has an unbound namespace prefix, the corresponding descendant of the created EntityReference node is also unbound; (its namespaceURI is null). The DOM Level 2 does not support any mechanism to resolve namespace prefixes." );
	return nil;
}

-(DOMNodeList*) getElementsByTagName:(NSString*) data
{
	DOMNodeList* accumulator = [[DOMNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:data inNamespace:nil childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(DOMNode*) importNode:(DOMNode*) importedNode deep:(BOOL) deep
{
	NSAssert( FALSE, @"Not implemented." );
	return nil;
}

// Introduced in DOM Level 2:
-(DOMElement*) createElementNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	DOMElement* newElement = [[DOMElement alloc] initWithQualifiedName:qualifiedName inNameSpaceURI:namespaceURI attributes:nil];
	
	SVGKitLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

// Introduced in DOM Level 2:
-(DOMAttr*) createAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	NSAssert( FALSE, @"This should be re-implemented to share code with createElementNS: method above" );
	DOMAttr* newAttr = [[DOMAttr alloc] initWithNamespace:namespaceURI qualifiedName:qualifiedName value:@""];
	return newAttr;
}

// Introduced in DOM Level 2:
-(DOMNodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	DOMNodeList* accumulator = [[DOMNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:localName inNamespace:namespaceURI childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(DOMElement*) getElementById:(NSString*) elementId
{
	return [DOMHelperUtilities privateGetElementById:elementId childrenOfElement:self.documentElement];
}

@end

#endif
