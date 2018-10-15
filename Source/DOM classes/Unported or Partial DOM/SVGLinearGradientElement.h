//
//  SVGLinearGradientElement.h
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/15.
//  Copyright © 2018年 na. All rights reserved.
//

#import "SVGGradientElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVGLinearGradientElement : SVGGradientElement

@property (nonatomic, readonly) CGFloat x1;
@property (nonatomic, readonly) CGFloat y1;
@property (nonatomic, readonly) CGFloat x2;
@property (nonatomic, readonly) CGFloat y2;

@end

NS_ASSUME_NONNULL_END
