#if __has_include(<WebKit/DOMElement.h>)
#import <WebKit/DOMElement.h>
#else

#import "DOMElement.h"

#import "DOMNamedNodeMap.h"
#import "DOMHelperUtilities.h"

@interface DOMElement()
@property(nonatomic,strong,readwrite) NSString* tagName;
@end

@implementation DOMElement

@synthesize tagName;


- (id)initWithLocalName:(NSString*) n attributes:(NSMutableDictionary*) attributes {
    self = [super initType:DOMNodeType_ELEMENT_NODE name:n];
    if (self) {
        self.tagName = n;
		
		for( NSString* attributeName in attributes.allKeys )
		{
			[self setAttribute:attributeName value:[attributes objectForKey:attributeName]];
		}
    }
    return self;
}
- (id)initWithQualifiedName:(NSString*) n inNameSpaceURI:(NSString*) nsURI attributes:(NSMutableDictionary *)attributes
{
    self = [super initType:DOMNodeType_ELEMENT_NODE name:n inNamespace:nsURI];
    if (self) {
        self.tagName = n;
		
		for( DOMAttr* attribute in attributes.allValues )
		{
			[self.attributes setNamedItemNS:attribute inNodeNamespace:nsURI];
		}
    }
    return self;
}

-(NSString*) getAttribute:(NSString*) name
{
	/**
	 WARNING: the definition in the spec WILL CORRUPT unsuspecting Objective-C code (including a lot of the original SVGKit code!).
	 
	 The spec - instead of defining 'nil' - defines "" (empty string) as the
	 correct response.
	 
	 But in most of the modern, C-based, (non-scripting) languages, "" means 0.
	 
	 Very dangerous!
	 */
	DOMAttr* result = (DOMAttr*) [self.attributes getNamedItem:name];
	
	if( result == nil || result.value == nil )
		return @""; // according to spec
	else
		return result.value;
}

-(void) setAttribute:(NSString*) name value:(NSString*) value
{
	DOMAttr* att = [[DOMAttr alloc] initWithName:name value:value];
	
	[self.attributes setNamedItem:att];
}

-(void) removeAttribute:(NSString*) name
{
	[self.attributes removeNamedItem:name];
	
	NSAssert( FALSE, @"Not fully implemented. Spec says: If the removed attribute is known to have a default value, an attribute immediately appears containing the default value as well as the corresponding namespace URI, local name, and prefix when applicable." );
}

-(DOMAttr*) getAttributeNode:(NSString*) name
{
	return (DOMAttr*) [self.attributes getNamedItem:name];
}

-(DOMAttr*) setAttributeNode:(DOMAttr*) newAttr
{
	DOMAttr* oldAtt = (DOMAttr*) [self.attributes getNamedItem:newAttr.nodeName];
	
	[self.attributes setNamedItem:newAttr];
	
	return oldAtt;
}

-(DOMAttr*) removeAttributeNode:(DOMAttr*) oldAttr
{
	[self.attributes removeNamedItem:oldAttr.nodeName];
	
	NSAssert( FALSE, @"Not fully implemented. Spec: If the removed Attr  has a default value it is immediately replaced. The replacing attribute has the same namespace URI and local name, as well as the original prefix, when applicable. " );
	
	return oldAttr;
}

-(DOMNodeList*) getElementsByTagName:(NSString*) name
{
	DOMNodeList* accumulator = [[DOMNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:name inNamespace:nil childrenOfElement:self addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(NSString*) getAttributeNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	DOMAttr* result = (DOMAttr*) [self.attributes getNamedItemNS:namespaceURI localName:localName];
	
	if( result == nil || result.value == nil )
		return @""; // according to spec
	else
		return result.value;
}

// Introduced in DOM Level 2:
-(void) setAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName value:(NSString*) value
{
	DOMAttr* att = [[DOMAttr alloc] initWithNamespace:namespaceURI qualifiedName:qualifiedName value:value];
	
	[self.attributes setNamedItemNS:att];
}

// Introduced in DOM Level 2:
-(void) removeAttributeNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	NSAssert( FALSE, @"Not implemented yet" );
}

// Introduced in DOM Level 2:
-(DOMAttr*) getAttributeNodeNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	DOMAttr* result = (DOMAttr*) [self.attributes getNamedItemNS:namespaceURI localName:localName];
	
	return result;
}

// Introduced in DOM Level 2:
-(DOMAttr*) setAttributeNodeNS:(DOMAttr*) newAttr
{
	NSAssert( FALSE, @"Not implemented yet" );
	return nil;
}

// Introduced in DOM Level 2:
-(DOMNodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	DOMNodeList* accumulator = [[DOMNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:localName inNamespace:namespaceURI childrenOfElement:self addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(BOOL) hasAttribute:(NSString*) name
{
	DOMAttr* result = (DOMAttr*) [self.attributes getNamedItem:name];
	
	return result != nil;
}

// Introduced in DOM Level 2:
-(BOOL) hasAttributeNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	NSAssert( FALSE, @"Not implemented yet" );
	return FALSE;
}

@end

#endif
