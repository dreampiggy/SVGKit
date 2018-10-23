//
//  CDATASection.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#if __has_include(<WebKit/DOMText.h>)
#import <WebKit/DOMCDATASection.h>
#else

#import "DOMCDATASection.h"

@implementation DOMCDATASection

- (id)initWithValue:(NSString*) v
{
    self = [super initType:DOMNodeType_CDATA_SECTION_NODE name:@"#cdata-section" value:v];
    if (self) {
    }
    return self;
}
@end

#endif
