//
//  MKYogaTransform.h
//  MKYogaLayout
//  Felx属性转换类
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYogaLayout.h"


@interface MKYogaTransform : NSObject

+ (YGValue)transYGValue:(id)value;
+ (YGJustify)transYGJustify:(id)value;
+ (YGAlign)transYGAlign:(id)value;
+ (YGPositionType)transYGPositionType:(id)value;
+ (YGFlexDirection)transYGFlexDirection:(id)value;
+ (YGWrap)transYGWrap:(id)value;
+ (YGOverflow)transYGOverflow:(id)value;
+ (YGDisplay)transYGDisplay:(id)value;
+ (UIColor *)transColor:(id)value;

@end

