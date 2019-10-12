//
//  UILabel+MKYogaStyle.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYogaLayout.h"

#pragma mark - Attrs

static const NSString *kLText = @"text"; /// 字符串类型
static const NSString *kLTextColor = @"textColor"; /// RGB类型
static const NSString *kLFont = @"font"; /// 浮点数, 字体
static const NSString *kLBoldFont = @"boldFont"; /// 浮点数, 加粗字体
static const NSString *kLTextAlignment = @"textAlignment"; // 文本对齐，NSString: left, center, right; NSTextAlignment: all
static const NSString *kLLineBreakMode = @"lineBreakMode"; // 截断，NSString word-wrapping, truncating-tail, truncating-middle, truncating-head; NSLineBreakMode: all
static const NSString *kLMaxLines = @"maxLines"; /// 最大行数，整数
static const NSString *kLLineSpace = @"lineSpace"; /// 行间距

@interface UILabel (MKYogaStyle)


- (void)setText:(NSString *)text lineSpace:(CGFloat)lineSpace;
@end
