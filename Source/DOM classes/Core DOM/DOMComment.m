//
//  Comment.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#if __has_include(<WebKit/DOMComment.h>)
#import <WebKit/DOMComment.h>
#else

#import "DOMComment.h"

@implementation DOMComment

- (id)initWithValue:(NSString*) v
{
    self = [super initType:DOMNodeType_COMMENT_NODE name:@"#comment" value:v];
    if (self) {
    }
    return self;
}

@end

#endif
