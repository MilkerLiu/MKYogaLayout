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
static const NSString *kLBindTap = @"bindtap";                  /// 拥有半透明点击态
static const NSString *kLBindTouch = @"bindtouch";              /// 轻触，点击，无点击态
static const NSString *kLAlias = @"alias";
static const NSString *kLObj = @"obj";
static const NSString *kLNavigation = @"navigation"; /// 导航器
    static const NSString *kLNavigationPage = @"navigationPage"; /// 目标页面
    static const NSString *kLNavigationOpt = @"navigationOpt";   /// 携带的参数
    static const NSString *kLNavigationType = @"navigationType"; /// 采用Push还是Present

static const NSString *kLDirection = @"direction";              /// 方向，LTR,RTL, 一般不用这个属性
static const NSString *kLFlexDirection = @"flexDirection";      /// 子视图方向 Column:纵向，Row:横向
static const NSString *kLJustifyContent = @"justifyContent";    /// 子视图主轴对齐 左，中，右，Between: 两边0; Around: 两边等于中间1半; Evenly: 两边等于中间
static const NSString *kLAlignContent = @"alignContent";        /// 多行对齐规则
static const NSString *kLAlignItems = @"alignItems";            /// 子视图交叉轴对齐规则 上，中，下
static const NSString *kLAlignSelf = @"alignSelf";              /// 子视图相对父视图对齐规则
static const NSString *kLPosition = @"position";                /// 相对布局还是绝对布局
static const NSString *kLFlexWrap = @"flexWrap";                /// 折行规则
static const NSString *kLOverflow = @"overflow";                /// 截断规则
static const NSString *kLDisplay = @"display";                  /// 是否展示，不展示时，margin和自身尺寸都无效
static const NSString *kLFlexGrow = @"flexGrow";                /// 尺寸权重比
static const NSString *kLFlexBasis = @"flexBasis";
static const NSString *kLFlexShrink = @"flexShrink";            /// 尺寸压缩比

static const NSString *kLWidth = @"width";                      /// 尺寸值，逻辑尺寸， "100%"
static const NSString *kLHeight = @"height";
static const NSString *kLMinWidth = @"minWidth";
static const NSString *kLMinHeight = @"minHeight";
static const NSString *kLMaxWidth = @"maxWidth";
static const NSString *kLMaxHeight = @"maxHeight";

static const NSString *kLLeft = @"left";                        /// 绝对定位
static const NSString *kLTop = @"top";
static const NSString *kLRight = @"right";
static const NSString *kLBottom = @"bottom";
static const NSString *kLStart = @"start";
static const NSString *kLEnd = @"end";

static const NSString *kLPaddingLeft = @"paddingLeft";         /// 内边距
static const NSString *kLPaddingTop = @"paddingTop";
static const NSString *kLPaddingRight = @"paddingRight";
static const NSString *kLPaddingBottom = @"paddingBottom";
static const NSString *kLPaddingHorizontal = @"paddingHorizontal";
static const NSString *kLPaddingVertical = @"paddingVertical";
static const NSString *kLPadding = @"padding";

static const NSString *kLMarginLeft = @"marginLeft";           /// 外边距
static const NSString *kLMarginTop = @"marginTop";
static const NSString *kLMarginRight = @"marginRight";
static const NSString *kLMarginBottom = @"marginBottom";
static const NSString *kLMarginHorizontal = @"marginHorizontal";
static const NSString *kLMarginVertical = @"marginVertical";
static const NSString *kLMargin = @"margin";

static const NSString *kLBg = @"bg";                      /// RGB, 背景色
static const NSString *kLBg_Highlight = @"bg_highlight";  /// RGB, 背景高亮颜色，有点击状态时有效
static const NSString *kLBorder = @"border";              /// 描边  "$Width $Color"
static const NSString *kLShadow = @"shadow";              /// 阴影  "$OffsetX $OffsetY $Color $opacity"
static const NSString *kLCorner = @"corner";              /// 圆角  10
static const NSString *kLAlpha = @"alpha"; // 透明度，Float, 0~1, 0: 全透明
static const NSString *kLHidden = @"hidden"; // 占位隐藏，Boolean, YES: 隐藏

@interface UIView (MKYogaStyle)

@property (nonatomic, strong) id obj; /// 给视图绑定的示例，存储数据用
@property (nonatomic, strong) UIColor *mk_bgHighlight; /// 高亮背景色
@property (nonatomic, strong) UIColor *mk_bg; /// 高亮普通色
@property (nonatomic, copy) NSString *mk_uri; /// 点击路由
@property (nonatomic, copy) NSDictionary *mk_navigation; /// 点击路由

@end
