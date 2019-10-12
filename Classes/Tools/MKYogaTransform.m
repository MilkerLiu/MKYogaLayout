//
//  MKYogaTransform.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYogaTransform.h"

@implementation MKYogaTransform
#pragma mark - 类型转换

+ (YGValue)transYGValue:(id)value {
    if (!value) return YGPointValue(0);;
    if ([value isKindOfClass:[NSString class]]) {
        // percent
        if ([(NSString *)value containsString:@"%"]) {
            return YGPercentValue([[value stringByReplacingOccurrencesOfString:@"%" withString:@""] floatValue]);
        } else if ([value isEqualToString:@"auto"]) {
            return YGValueAuto;
        }
    } else {
        return YGPointValue([value floatValue]);
    }
    return YGPointValue(0);
}

//YGJustifyFlexStart,
//YGJustifyCenter,
//YGJustifyFlexEnd,
//YGJustifySpaceBetween, //
//YGJustifySpaceAround,
//YGJustifySpaceEvenly,
+ (YGJustify)transYGJustify:(id)value {
    if (!value) return YGJustifyFlexStart;
    if ([value isKindOfClass:NSNumber.class]) return (YGJustify)[value integerValue];
    if ([value isEqualToString:@"flex-start"]) {
        return YGJustifyFlexStart;
    } else if ([value isEqualToString:@"center"]) {
        return YGJustifyCenter;
    } else if ([value isEqualToString:@"flex-end"]) {
        return YGJustifyFlexEnd;
    } else if ([value isEqualToString:@"space-between"]) {
        return YGJustifySpaceBetween;
    } else if ([value isEqualToString:@"space-around"]) {
        return YGJustifySpaceAround;
    } else if ([value isEqualToString:@"space-evenly"]) {
        return YGJustifySpaceEvenly;
    }
    return YGJustifyFlexStart;
}

//YGAlignAuto,
//YGAlignFlexStart,
//YGAlignCenter,
//YGAlignFlexEnd,
//YGAlignStretch,
//YGAlignBaseline,
//YGAlignSpaceBetween,
//YGAlignSpaceAround,
+ (YGAlign)transYGAlign:(id)value {
    if (!value) return YGAlignAuto;
    if ([value isKindOfClass:NSNumber.class]) return (YGAlign)[value integerValue];
    if ([value isEqualToString:@"auto"]) {
        return YGAlignAuto;
    } else if ([value isEqualToString:@"flex-start"]) {
        return YGAlignFlexStart;
    } else if ([value isEqualToString:@"center"]) {
        return YGAlignCenter;
    } else if ([value isEqualToString:@"flex-end"]) {
        return YGAlignFlexEnd;
    } else if ([value isEqualToString:@"stretch"]) {
        return YGAlignStretch;
    } else if ([value isEqualToString:@"baseline"]) {
        return YGAlignBaseline;
    } else if ([value isEqualToString:@"space-between"]) {
        return YGAlignSpaceBetween;
    } else if ([value isEqualToString:@"space-around"]) {
        return YGAlignSpaceBetween;
    }
    return YGAlignAuto;
}

//YGPositionTypeRelative,
//YGPositionTypeAbsolute,
+ (YGPositionType)transYGPositionType:(id)value {
    if (!value) return YGPositionTypeRelative;
    if ([value isKindOfClass:NSNumber.class]) return (YGPositionType)[value integerValue];
    if ([value isEqualToString:@"relative"]) {
        return YGPositionTypeRelative;
    } else if ([value isEqualToString:@"absolute"]) {
        return YGPositionTypeAbsolute;
    }
    return YGPositionTypeRelative;
}

//YGFlexDirectionColumn,
//YGFlexDirectionColumnReverse,
//YGFlexDirectionRow,
//YGFlexDirectionRowReverse,
+ (YGFlexDirection)transYGFlexDirection:(id)value {
    if (!value) return YGFlexDirectionColumn;
    if ([value isKindOfClass:NSNumber.class]) return (YGFlexDirection)[value integerValue];
    if ([value isEqualToString:@"column"]) {
        return YGFlexDirectionColumn;
    } else if ([value isEqualToString:@"column-reverse"]) {
        return YGFlexDirectionColumnReverse;
    } else if ([value isEqualToString:@"row"]) {
        return YGFlexDirectionRow;
    } else if ([value isEqualToString:@"row-reverse"]) {
        return YGFlexDirectionRowReverse;
    }
    return YGFlexDirectionColumn;
}

//YGWrapNoWrap,
//YGWrapWrap,
//YGWrapWrapReverse,
+ (YGWrap)transYGWrap:(id)value {
    if (!value) return YGWrapNoWrap;
    if ([value isKindOfClass:NSNumber.class]) return (YGWrap)[value integerValue];
    if ([value isEqualToString:@"no-wrap"]) {
        return YGWrapNoWrap;
    } else if ([value isEqualToString:@"wrap"]) {
        return YGWrapWrap;
    } else if ([value isEqualToString:@"wrap-reverse"]) {
        return YGWrapWrapReverse;
    }
    return YGWrapNoWrap;
}

//YGOverflowVisible,
//YGOverflowHidden,
//YGOverflowScroll,
+ (YGOverflow)transYGOverflow:(id)value {
    if (!value) return YGOverflowVisible;
    if ([value isKindOfClass:NSNumber.class]) return (YGOverflow)[value integerValue];
    if ([value isEqualToString:@"visible"]) {
        return YGOverflowVisible;
    } else if ([value isEqualToString:@"hidden"]) {
        return YGOverflowHidden;
    } else if ([value isEqualToString:@"scroll"]) {
        return YGOverflowScroll;
    }
    return YGOverflowVisible;
}

//YGDisplayFlex,
//YGDisplayNone,
+ (YGDisplay)transYGDisplay:(id)value {
    if (!value) return YGDisplayFlex;
    if ([value isKindOfClass:NSNumber.class]) return (YGDisplay)[value integerValue];
    if ([value isEqualToString:@"flex"]) {
        return YGDisplayFlex;
    } else if ([value isEqualToString:@"none"]) {
        return YGDisplayNone;
    }
    return YGDisplayFlex;
}

+ (UIColor *)transColor:(id)value {
    return [UIColor colorWithHexString:value];
}
@end
