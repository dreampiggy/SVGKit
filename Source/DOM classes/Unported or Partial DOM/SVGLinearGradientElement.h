//
//  SVGLinearGradientElement.h
//  SVGKit-iOS
//
//  Created by lizhuoli on 2018/10/15.
//  Copyright © 2018年 na. All rights reserved.
//

#import "SVGGradientElement.h"

@interface SVGLinearGradientElement : SVGGradientElement <SVGTransformable>

@property (nonatomic, readonly) SVGLength *x1;
@property (nonatomic, readonly) SVGLength *y1;
@property (nonatomic, readonly) SVGLength *x2;
@property (nonatomic, readonly) SVGLength *y2;

@end
