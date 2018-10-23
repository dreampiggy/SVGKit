//
//  DocumentFragment.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#if __has_include(<WebKit/DOMDocumentFragment.h>)
#import <WebKit/DOMDocumentFragment.h>
#else

#import "DOMDocumentFragment.h"

@implementation DOMDocumentFragment

- (id)init
{
    self = [super initType:DOMNodeType_DOCUMENT_FRAGMENT_NODE name:nil];
    if (self) {
		
    }
    return self;
}
@end

#endif
