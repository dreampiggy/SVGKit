//
//  SVGRadialGradientElement.h
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/15.
//  Copyright © 2018年 na. All rights reserved.
//

#import "SVGGradientElement.h"

@interface SVGRadialGradientElement : SVGGradientElement

@property (nonatomic, readonly) SVGLength *cx;
@property (nonatomic, readonly) SVGLength *cy;
@property (nonatomic, readonly) SVGLength *r;
@property (nonatomic, readonly) SVGLength *fx;
@property (nonatomic, readonly) SVGLength *fy;
@property (nonatomic, readonly) SVGLength *fr;

@end
