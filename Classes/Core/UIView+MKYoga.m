//
//  UIView+MKYoga.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/26.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "UIView+MKYoga.h"
#import "objc/runtime.h"
#import "MKTapGestureRecognizer.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation UIView (MKYoga)

#pragma mark - self attrs

- (void)setLayout:(NSDictionary *)layout {
    objc_setAssociatedObject(self, @"mk-layout", layout ?: @{}, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)layout {
    return objc_getAssociatedObject(self, @"mk-layout");
}

#pragma mark - views tools

+ (UIView *)createByLayout:(NSDictionary *)layout {
    UIView *view = [self createByLayout:layout context:nil];
    return view;
}

+ (UIView *)createByLayout:(NSDictionary *)layout context:(NSObject *)context {
    UIView *view = [self createByLayout:layout context:context style:nil data:nil];
    return view;
}

+ (UIView *)createByLayout:(NSDictionary *)layout
                   context:(NSObject *)context
                     style:(NSDictionary *)style
                      data:(id)data {
    UIView *view = (UIView *) [[self.class alloc] init];
    [self createSubViewsByLayout:layout rootView:view context:context style:style data:data];
    return view;
}

+ (void)createSubViewsByLayout:(NSDictionary *)layout rootView:(UIView *)rootView {
    [self createSubViewsByLayout:layout rootView:rootView context:nil];
}

+ (void)createSubViewsByLayout:(NSDictionary *)layout
                      rootView:(UIView *)rootView
                       context:(NSObject *)context {
    [self createSubViewsByLayout:layout rootView:rootView context:context style:nil data:nil];
}

+ (void)createSubViewsByLayout:(NSDictionary *)layout
                      rootView:(UIView *)rootView
                       context:(NSObject *)context
                         style:(NSDictionary *)style
                          data:(id)data {
    NSAssert(rootView != nil, @"MKYogaLayout: root view not nil");
    NSAssert([rootView isKindOfClass:UIView.class], @"MKYogaLayout: root view must is a view");
    [rootView setAttributes:layout style:style context:context data:data];
    [rootView applyLayout];
}

+ (UIView *)createViewByLayoutName:(NSString *)layoutName context:(NSObject *)context data:(NSDictionary *)data {
    NSDictionary *layout = [MKYoga readLocalFileWithName:layoutName];
    UIView *view = [UIView createViewByStyle:layout
                                     context:context
                                        data:data];
    return view;
}

+ (UIView *)createViewByStyle:(NSDictionary *)style context:(NSObject *)context data:(NSDictionary *)data {
    @try {
        NSDictionary *subStyle = style[@"_style"];
        NSDictionary *layout = subStyle ? style[@"layout"] : style;
        UIView *view = [UIView createByLayout:layout context:context style:subStyle data:data];
        return view;
    } @catch (NSException *exception) {
    } @finally {

    }
    return nil;
}

+ (UIView *)createView:(NSDictionary *)style subStyle:(NSDictionary *)subStyle context:(NSObject *)context data:(NSDictionary *)data {
    id viewName = style[kLView];
    UIView *view;
    if ([viewName isKindOfClass:NSString.class]) { // 字符串类型
        view = (UIView *) [NSClassFromString(viewName) new];
    } else {
        view = [viewName new];
    }
    if (!view) {
        NSLog(@"can't find view for class %@", viewName);
        return nil;
    }

    [view setAttributes:style style:subStyle context:context data:data];

    return view;
}

- (void)setAttributes:(NSDictionary *)attrs style:(NSDictionary *)style context:(NSObject *)context data:(id)data {
    // 设置属性
    self.layout = attrs;

    {
        // bind touch event
        NSString *eventFuncName = attrs[kLBindTouch];
        if (eventFuncName) {
            NSString *selectorName = [NSString stringWithFormat:@"%@:", eventFuncName];
            SEL selector = NSSelectorFromString(selectorName);
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:context action:selector];
            self.userInteractionEnabled = YES;
            [self addGestureRecognizer:tap];
        }
    }


    {
        // bind tap event
        NSString *eventFuncName = attrs[kLBindTap];
        if (eventFuncName) {
            NSString *selectorName = [NSString stringWithFormat:@"%@:", eventFuncName];
            SEL selector = NSSelectorFromString(selectorName);
            MKTapGestureRecognizer *tap = [[MKTapGestureRecognizer alloc] initWithTarget:context action:selector];
            self.userInteractionEnabled = YES;
            [self addGestureRecognizer:tap];
        }
    }

    {
        // bind navigation
        NSDictionary *navigation = attrs[kLNavigation];
        id page = navigation[kLNavigationPage];
        Class pageClass;
        if ([page isKindOfClass:NSString.class]) {
            pageClass = NSClassFromString(page);
        } else {
            pageClass = page;
        }

        MKNavigatorType type = (MKNavigatorType) navigation[kLNavigationType];
        id opt = navigation[kLNavigationOpt];


    }

    {
        // set alias
        NSString *alias = attrs[kLAlias];
        if (alias && alias.length > 0) {
            [context setValue:self forKey:alias];
        }
    }

    {
        // set general style
        NSString *styleName = attrs[kLStyle];
        if (styleName) {
            NSArray *styles = [styleName componentsSeparatedByString:@" "];
            [styles enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *_Nonnull stop) {
                if (obj.length > 0) {
                    NSDictionary *cstyle = [MKYoga styleWithName:obj];
                    if (cstyle) { /// global style
                        [self setStyle:cstyle data:data];
                    }
                    NSDictionary *csstyle = style[obj];
                    if (csstyle) { /// partial style
                        [self setStyle:csstyle data:data];
                    }
                }
            }];
        }

        // private style
        [self configureLayoutWithBlock:^(YGLayout *_Nonnull layout) {
            layout.isEnabled = YES;
            [self setStyle:attrs data:data];
        }];
    }

    {
        /// subviews
        if ([[attrs allKeys] containsObject:kLSubviews]) {
            [attrs[kLSubviews] enumerateObjectsUsingBlock:^(NSDictionary *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
                UIView *subView = [UIView createView:obj subStyle:style context:context data:data];
                [self addSubview:subView];
            }];
        }
    }
}

- (void)setStyle:(NSDictionary *)style data:(id)data {
    [style enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *_Nonnull stop) {
        SEL selector = NSSelectorFromString([NSString stringWithFormat:@"set_%@:style:", key]);
        if ([self respondsToSelector:selector]) {
            id value = obj;
            if (data) {
                value = [MKExpression resultWithExpression:obj context:data];
            }
            [self performSelector:selector withObject:value withObject:style];
        }
    }];
}

#pragma mark - 数据更新

- (void)updateViewWithData:(id)data {
    [self updateWithData:data layout:self.layout];
    [self applyLayout];
}

- (void)updateWithData:(NSDictionary *)data layout:(NSDictionary *)layout {
    [self setStyle:layout data:data];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if (obj.yoga.isEnabled) {
            [obj updateWithData:data layout:obj.layout];
        }
    }];
}

#pragma mark - 布局更新

- (void)applyLayout {
    [self.yoga applyLayoutPreservingOrigin:YES];
}

- (void)applyLayoutWidth {
    [self.yoga applyLayoutPreservingOrigin:YES dimensionFlexibility:YGDimensionFlexibilityFlexibleWidth];
}

- (void)applyLayoutHeight {
    [self.yoga applyLayoutPreservingOrigin:YES dimensionFlexibility:YGDimensionFlexibilityFlexibleHeight];
}

- (void)applyLayoutAll {
    [self.yoga applyLayoutPreservingOrigin:YES dimensionFlexibility:YGDimensionFlexibilityFlexibleWidth | YGDimensionFlexibilityFlexibleHeight];
}

#pragma mark - 辅助函数

- (UIViewController *)viewController {
    for (UIView *next = self; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *) nextResponder;
        }
    }
    return nil;
}

@end

#pragma clang diagnostic pop