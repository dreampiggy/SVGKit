#if __has_include(<WebKit/DOMNode.h>)
#import <WebKit/DOMNode.h>
#else

/**
 Makes the writable properties all package-private, effectively
 */
#import "DOMNode.h"

@interface DOMNode()
@property(nonatomic,strong,readwrite) NSString* nodeName;
@property(nonatomic,strong,readwrite) NSString* nodeValue;

@property(nonatomic,readwrite) DOMNodeType nodeType;
@property(nonatomic,weak,readwrite) DOMNode* parentNode;
@property(nonatomic,strong,readwrite) DOMNodeList* childNodes;
@property(nonatomic,strong,readwrite) DOMNamedNodeMap* attributes;

@property(nonatomic,weak,readwrite) DOMDocument* ownerDocument;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* namespaceURI;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* prefix;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* localName;

@end

#endif
