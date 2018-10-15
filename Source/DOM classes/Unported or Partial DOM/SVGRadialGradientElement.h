//
//  SVGRadialGradientElement.h
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/15.
//  Copyright © 2018年 na. All rights reserved.
//

#import "SVGGradientElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVGRadialGradientElement : SVGGradientElement

@property (nonatomic, readonly) CGFloat cx;
@property (nonatomic, readonly) CGFloat cy;
@property (nonatomic, readonly) CGFloat r;
@property (nonatomic, readonly) CGFloat fx;
@property (nonatomic, readonly) CGFloat fy;
@property (nonatomic, readonly) CGFloat fr;

@end

NS_ASSUME_NONNULL_END
