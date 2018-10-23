//
//  ProcessingInstruction.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#if __has_include(<WebKit/DOMProcessingInstruction.h>)
#import <WebKit/DOMProcessingInstruction.h>
#else

#import "DOMProcessingInstruction.h"

@interface DOMProcessingInstruction()
@property(nonatomic,strong,readwrite) NSString* target;
@property(nonatomic,strong,readwrite) NSString* data;
@end

@implementation DOMProcessingInstruction

@synthesize target;
@synthesize data;

-(id) initProcessingInstruction:(NSString*) t value:(NSString*) d
{
    self = [super initType:DOMNodeType_PROCESSING_INSTRUCTION_NODE name:t value:d];
    if (self) {
		self.target = t;
		self.data = d;
    }
    return self;
}

@end

#endif
