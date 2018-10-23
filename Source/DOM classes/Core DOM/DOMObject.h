//
//  DOMObject.h
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/23.
//  Copyright © 2018年 na. All rights reserved.
//
#if __has_include(<WebKit/DOMObject.h>)
#import <WebKit/DOMObject.h>

@interface DOMObject (Private)

//@property (atomic, readonly) DOMStyleSheet *sheet;

- (id)init NS_AVAILABLE_MAC(10_4);

// DOMObject (DOMLinkStyle)

//- (id)sheet;

@end

#else

#import <Foundation/Foundation.h>

@interface DOMObject : NSObject

@end

#endif
