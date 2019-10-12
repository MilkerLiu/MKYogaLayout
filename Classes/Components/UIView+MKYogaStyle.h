//
//  UIView+MKYogaStyle.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYogaLayout.h"

static const NSString *kLView = @"view";
static const NSString *kLSubviews = @"subviews";
static const NSString *kLStyle = @"style";
static const NSString *kLUri = @"uri";
static const NSString *kLBindTap = @"bindtap"; /// 拥有半透明点击态
static const NSString *kLBindTouch = @"bindtouch"; /// 轻触，点击，无点击态
static const NSString *kLAlias = @"alias";
static const NSString *kLObj = @"obj";

static const NSString *kLDirection = @"direction";
static const NSString *kLFlexDirection = @"flexDirection";
static const NSString *kLJustifyContent = @"justifyContent";
static const NSString *kLAlignContent = @"alignContent";
static const NSString *kLAlignItems = @"alignItems";
static const NSString *kLAlignSelf = @"alignSelf";
static const NSString *kLPosition = @"position";
static const NSString *kLFlexWrap = @"flexWrap";
static const NSString *kLOverflow = @"overflow";
static const NSString *kLDisplay = @"display";
static const NSString *kLFlexGrow = @"flexGrow";
static const NSString *kLFlexBasis = @"flexBasis";
static const NSString *kLFlexShrink = @"flexShrink";

static const NSString *kLWidth = @"width";
static const NSString *kLHeight = @"height";
static const NSString *kLMinWidth = @"minWidth";
static const NSString *kLMinHeight = @"minHeight";
static const NSString *kLMaxWidth = @"maxWidth";
static const NSString *kLMaxHeight = @"maxHeight";

static const NSString *kLLeft = @"left";
static const NSString *kLTop = @"top";
static const NSString *kLRight = @"right";
static const NSString *kLBottom = @"bottom";
static const NSString *kLStart = @"start";
static const NSString *kLEnd = @"end";

static const NSString *kLPaddingLeft = @"paddingLeft";
static const NSString *kLPaddingTop = @"paddingTop";
static const NSString *kLPaddingRight = @"paddingRight";
static const NSString *kLPaddingBottom = @"paddingBottom";
static const NSString *kLPaddingHorizontal = @"paddingHorizontal";
static const NSString *kLPaddingVertical = @"paddingVertical";
static const NSString *kLPadding = @"padding";

static const NSString *kLMarginLeft = @"marginLeft";
static const NSString *kLMarginTop = @"marginTop";
static const NSString *kLMarginRight = @"marginRight";
static const NSString *kLMarginBottom = @"marginBottom";
static const NSString *kLMarginHorizontal = @"marginHorizontal";
static const NSString *kLMarginVertical = @"marginVertical";
static const NSString *kLMargin = @"margin";

static const NSString *kLBg = @"bg";
static const NSString *kLBg_Highlight = @"bg_highlight";  /// RGB, 背景高亮颜色
static const NSString *kLBorder = @"border";
static const NSString *kLShadow = @"shadow";
static const NSString *kLCorner = @"corner";
static const NSString *kLAlpha = @"alpha"; // 透明度，Float, 0~1, 0: 全透明
static const NSString *kLHidden = @"hidden"; // 占位隐藏，Boolean, YES: 隐藏

@interface UIView (MKYogaStyle)

@property (nonatomic, strong) id obj; /// 给视图绑定的示例，存储数据用
@property (nonatomic, strong) UIColor *mkBgHighlight; /// 高亮背景色
@property (nonatomic, strong) UIColor *mkBg; /// 高亮普通色
@property (nonatomic, copy) NSString *mkUri; /// 点击路由

@end
