//
//  UIView+MKYogaStyle.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+MKYogaStyle.h"
#import "MKTapGestureRecognizer.h"

@implementation UIView (MKYogaStyle)

#pragma mark - expands attrs

- (id)obj {
    return objc_getAssociatedObject(self, @selector(setObj:));
}

- (void)setObj:(id)obj {
    objc_setAssociatedObject(self, @selector(setObj:), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)mk_bgHighlight {
    return objc_getAssociatedObject(self, @selector(setMk_bgHighlight:));
}

- (void)setMk_bgHighlight:(UIColor *)bgHighlight {
    objc_setAssociatedObject(self, @selector(setMk_bgHighlight:), bgHighlight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)mk_bg {
    return objc_getAssociatedObject(self, @selector(setMk_bg:));
}

- (void)setMk_bg:(UIColor *)bg {
    objc_setAssociatedObject(self, @selector(setMk_bg:), bg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mk_uri {
    return objc_getAssociatedObject(self, @selector(setMk_uri:));
}

- (void)setMk_uri:(NSString *)mk_uri {
    objc_setAssociatedObject(self, @selector(setMk_uri:), mk_uri, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickWithUri)];
    [self addGestureRecognizer:tap];
}

- (void)onClickWithUri {
    if (self.mk_uri) { /// 路由执行
        [[MKYoga shareInstance].delegate mkYogaRouterEvent:self value:[NSURL URLWithString:self.mk_uri]];
    }
}

- (NSDictionary *)mk_navigation {
    return objc_getAssociatedObject(self, @selector(setMk_navigation:));
}

- (void)setMk_navigation:(NSDictionary *)mk_navigation {
    objc_setAssociatedObject(self, @selector(setMk_navigation:), mk_navigation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickWithNavigation)];
    [self addGestureRecognizer:tap];
}

- (void)onClickWithNavigation {
    NSDictionary *navigation = self.mk_navigation;
    if (navigation) {
        id page = navigation[kLNavigationPage];
        MKNavigatorType type = (MKNavigatorType) ([navigation[kLNavigationType] integerValue]);
        id opt = navigation[kLNavigationOpt];

        Class pageClass = [page isKindOfClass:NSString.class] ? NSClassFromString(page) : page;

        UIViewController *pageInstance = (UIViewController *)[pageClass new];
        if (!pageInstance) {
            return;
        }

        SEL sel = @selector(setOpt:);
        if ([pageInstance respondsToSelector:sel]) {
            [pageInstance performSelector:sel withObject:opt];
        }

        if (type == MKNavigatorPush) {
            [self.viewController.navigationController pushViewController:pageInstance animated:YES];
        } else if (type == MKNavigatorPresent) {
            [self.viewController.navigationController presentViewController:pageInstance animated:YES completion:^{
            }];
        } else if (type == MKNavigatorPresentWithNavigation) {
            UINavigationController *navVC = [[UINavigationController alloc] init];
            [navVC setViewControllers:@[pageInstance]];
            [self.viewController.navigationController presentViewController:navVC animated:YES completion:^{
            }];
        }
    }
}

- (void)set_tag:(id)value style:(NSDictionary *)style {
    self.tag = [value integerValue];
}

- (void)set_uri:(id)value style:(NSDictionary *)style {
    self.mk_uri = value;
}

- (void)set_navigation:(id)value style:(NSDictionary *)style {
    self.mk_navigation = value;
}

- (void)set_obj:(id)value style:(NSDictionary *)style {
    self.obj = value;
}

#pragma mark - style attrs
//@property (nonatomic, readwrite, assign) YGDirection direction;
//@property (nonatomic, readwrite, assign) YGFlexDirection flexDirection;
//@property (nonatomic, readwrite, assign) YGJustify justifyContent;
//@property (nonatomic, readwrite, assign) YGAlign alignContent;
//@property (nonatomic, readwrite, assign) YGAlign alignItems;
//@property (nonatomic, readwrite, assign) YGAlign alignSelf;
//@property (nonatomic, readwrite, assign) YGPositionType position;
//@property (nonatomic, readwrite, assign) YGWrap flexWrap;
//@property (nonatomic, readwrite, assign) YGOverflow overflow;
//@property (nonatomic, readwrite, assign) YGDisplay display;
//@property (nonatomic, readwrite, assign) CGFloat flexGrow;
//@property (nonatomic, readwrite, assign) CGFloat flexShrink;
//@property (nonatomic, readwrite, assign) YGValue flexBasis;

- (void)set_flexDirection:(id)value style:(NSDictionary *)style {
    self.yoga.flexDirection = [MKYogaTransform transYGFlexDirection:value];
}

- (void)set_justifyContent:(id)value style:(NSDictionary *)style {
    self.yoga.justifyContent = [MKYogaTransform transYGJustify:value];
}

- (void)set_alignContent:(id)value style:(NSDictionary *)style {
    self.yoga.alignContent = [MKYogaTransform transYGAlign:value];
}

- (void)set_alignItems:(id)value style:(NSDictionary *)style {
    self.yoga.alignItems = [MKYogaTransform transYGAlign:value];
}

- (void)set_alignSelf:(id)value style:(NSDictionary *)style {
    self.yoga.alignSelf = [MKYogaTransform transYGAlign:value];
}

- (void)set_flexWrap:(id)value style:(NSDictionary *)style {
    self.yoga.flexWrap = [MKYogaTransform transYGWrap:value];
}

- (void)set_display:(id)value style:(NSDictionary *)style {
    self.yoga.display = [MKYogaTransform transYGDisplay:value];
}

- (void)set_flexGrow:(id)value style:(NSDictionary *)style {
    self.yoga.flexGrow = [value floatValue];
}

- (void)set_flexShrink:(id)value style:(NSDictionary *)style {
    self.yoga.flexShrink = [value floatValue];
}

- (void)set_flexBasis:(id)value style:(NSDictionary *)style {
    self.yoga.flexBasis = [MKYogaTransform transYGValue:value];
}

- (void)set_position:(id)value style:(NSDictionary *)style {
    self.yoga.position = [MKYogaTransform transYGPositionType:value];
}

//@property (nonatomic, readwrite, assign) YGValue width;
//@property (nonatomic, readwrite, assign) YGValue height;
//@property (nonatomic, readwrite, assign) YGValue minWidth;
//@property (nonatomic, readwrite, assign) YGValue minHeight;
//@property (nonatomic, readwrite, assign) YGValue maxWidth;
//@property (nonatomic, readwrite, assign) YGValue maxHeight;
- (void)set_width:(id)value style:(NSDictionary *)style {
    self.yoga.width = [MKYogaTransform transYGValue:value];
}

- (void)set_height:(id)value style:(NSDictionary *)style {
    self.yoga.height = [MKYogaTransform transYGValue:value];
}

- (void)set_minWidth:(id)value style:(NSDictionary *)style {
    self.yoga.minWidth = [MKYogaTransform transYGValue:value];
}

- (void)set_minHeight:(id)value style:(NSDictionary *)style {
    self.yoga.minHeight = [MKYogaTransform transYGValue:value];
}

- (void)set_maxWidth:(id)value style:(NSDictionary *)style {
    self.yoga.maxWidth = [MKYogaTransform transYGValue:value];
}

- (void)set_maxHeight:(id)value style:(NSDictionary *)style {
    self.yoga.maxHeight = [MKYogaTransform transYGValue:value];
}

//@property (nonatomic, readwrite, assign) YGValue left;
//@property (nonatomic, readwrite, assign) YGValue top;
//@property (nonatomic, readwrite, assign) YGValue right;
//@property (nonatomic, readwrite, assign) YGValue bottom;
//@property (nonatomic, readwrite, assign) YGValue start;
//@property (nonatomic, readwrite, assign) YGValue end;
- (void)set_top:(id)value style:(NSDictionary *)style {
    self.yoga.top = [MKYogaTransform transYGValue:value];
}

- (void)set_left:(id)value style:(NSDictionary *)style {
    self.yoga.left = [MKYogaTransform transYGValue:value];
}

- (void)set_bottom:(id)value style:(NSDictionary *)style {
    self.yoga.bottom = [MKYogaTransform transYGValue:value];
}

- (void)set_right:(id)value style:(NSDictionary *)style {
    self.yoga.right = [MKYogaTransform transYGValue:value];
}

//@property (nonatomic, readwrite, assign) YGValue paddingLeft;
//@property (nonatomic, readwrite, assign) YGValue paddingTop;
//@property (nonatomic, readwrite, assign) YGValue paddingRight;
//@property (nonatomic, readwrite, assign) YGValue paddingBottom;
//@property (nonatomic, readwrite, assign) YGValue paddingStart;
//@property (nonatomic, readwrite, assign) YGValue paddingEnd;
//@property (nonatomic, readwrite, assign) YGValue paddingHorizontal;
//@property (nonatomic, readwrite, assign) YGValue paddingVertical;
//@property (nonatomic, readwrite, assign) YGValue padding;
- (void)set_padding:(id)value style:(NSDictionary *)style {
    self.yoga.padding = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingLeft:(id)value style:(NSDictionary *)style {
    self.yoga.paddingLeft = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingRight:(id)value style:(NSDictionary *)style {
    self.yoga.paddingRight = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingBottom:(id)value style:(NSDictionary *)style {
    self.yoga.paddingBottom = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingTop:(id)value style:(NSDictionary *)style {
    self.yoga.paddingTop = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingHorizontal:(id)value style:(NSDictionary *)style {
    self.yoga.paddingHorizontal = [MKYogaTransform transYGValue:value];
}

- (void)set_paddingVertical:(id)value style:(NSDictionary *)style {
    self.yoga.paddingVertical = [MKYogaTransform transYGValue:value];
}

//@property (nonatomic, readwrite, assign) YGValue marginLeft;
//@property (nonatomic, readwrite, assign) YGValue marginTop;
//@property (nonatomic, readwrite, assign) YGValue marginRight;
//@property (nonatomic, readwrite, assign) YGValue marginBottom;
//@property (nonatomic, readwrite, assign) YGValue marginStart;
//@property (nonatomic, readwrite, assign) YGValue marginEnd;
//@property (nonatomic, readwrite, assign) YGValue marginHorizontal;
//@property (nonatomic, readwrite, assign) YGValue marginVertical;
//@property (nonatomic, readwrite, assign) YGValue margin;
- (void)set_margin:(id)value style:(NSDictionary *)style {
    self.yoga.margin = [MKYogaTransform transYGValue:value];
}

- (void)set_marginTop:(id)value style:(NSDictionary *)style {
    self.yoga.marginTop = [MKYogaTransform transYGValue:value];
}

- (void)set_marginBottom:(id)value style:(NSDictionary *)style {
    self.yoga.marginBottom = [MKYogaTransform transYGValue:value];
}

- (void)set_marginRight:(id)value style:(NSDictionary *)style {
    self.yoga.marginRight = [MKYogaTransform transYGValue:value];
}

- (void)set_marginLeft:(id)value style:(NSDictionary *)style {
    self.yoga.marginLeft = [MKYogaTransform transYGValue:value];
}

- (void)set_marginHorizontal:(id)value style:(NSDictionary *)style {
    self.yoga.marginHorizontal = [MKYogaTransform transYGValue:value];
}

- (void)set_marginVertical:(id)value style:(NSDictionary *)style {
    self.yoga.marginVertical = [MKYogaTransform transYGValue:value];
}

//@property(nonatomic, strong) UIColor *bg;
//@property(nonatomic, strong) MKYGStyleBorder *border;
//@property(nonatomic, strong) MKYGStyleShadow *shadow;
//@property(nonatomic, strong) MKYGStyleCorner *corner;
- (void)set_bg:(id)value style:(NSDictionary *)style {
    self.backgroundColor = [MKYogaTransform transColor:value];
    self.mk_bg = self.backgroundColor;
}

- (void)set_bg_highlight:(id)value style:(NSDictionary *)style {
    self.mk_bgHighlight = [MKYogaTransform transColor:value];
}

- (void)set_shadow:(NSString *)value style:(NSDictionary *)style {
    NSArray *items = [value componentsSeparatedByString:@" "];
    CGFloat offsetX = [items[0] floatValue];
    CGFloat offsetY = [items[1] floatValue];
    NSString *color = [items[2] stringValue];
    NSInteger opacity = [items[3] integerValue];

    self.layer.shadowOpacity = opacity == 1;
    self.layer.shadowColor = [[MKYogaTransform transColor:color] CGColor];
    self.layer.shadowOffset = CGSizeMake(offsetX, offsetY);
}

- (void)set_corner:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:[NSString class]]) {
        // 多圆角
        NSArray *items = [value componentsSeparatedByString:@" "];
        if (items.count == 1) {
            self.layer.cornerRadius = [items[0] floatValue];
        } else if (items.count == 2) {
            // 四角不同圆角, TODO:
        }
    } else {
        // 单圆角
        self.layer.cornerRadius = [value floatValue];
    }

    self.layer.masksToBounds = YES;
}

- (void)set_border:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:[NSString class]]) {
        NSArray *items = [value componentsSeparatedByString:@" "];
        self.layer.borderWidth = [items[0] floatValue];
        self.layer.borderColor = [MKYogaTransform transColor:items[1]].CGColor;
    }
    // 四边描边不同, TODO:
}


@end
