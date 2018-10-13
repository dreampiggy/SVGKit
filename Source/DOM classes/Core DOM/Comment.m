//
//  Comment.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Comment.h"

#if SVGKIT_MAC
@implementation SVGKComment
#else
@implementation Comment
#endif

- (id)initWithValue:(NSString*) v
{
    self = [super initType:DOMNodeType_COMMENT_NODE name:@"#comment" value:v];
    if (self) {
    }
    return self;
}

@end
