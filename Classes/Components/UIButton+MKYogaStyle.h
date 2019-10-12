//
// Created by Milker on 2019-08-05.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MKYogaLayout.h"

static const NSString *kLTitle = @"title"; /// NSString, 按钮标题
static const NSString *kLTitleFont = @"titleFont"; /// Float, 按钮标题字体
static const NSString *kLTitleBoldFont = @"titleBoldFont"; /// Float, 按钮标题加粗
static const NSString *kLTitleColor = @"titleColor"; /// RGB, 按钮标题

static const NSString *kLTitleColor_Highlight = @"titleColor_highlight"; /// RGB, 标题高亮颜色
//static const NSString *kLBg_Highlight = @"bg_highlight";  /// RGB, 背景高亮颜色, 由View定义，Button重写

static const NSString *kLTitleColor_Disabled = @"titleColor_disabled"; /// RGB, 标题禁用颜色
static const NSString *kLBg_Disabled = @"bg_disabled";  /// RGB, 背景禁用颜色

static const NSString *kLDisabled = @"disabled";  /// 禁用

@interface UIButton (MKYogaStyle)

@end

@interface UIButton (MKYogaButton)
- (void)setBGColor:(UIColor *)color forState:(UIControlState)state;
@end