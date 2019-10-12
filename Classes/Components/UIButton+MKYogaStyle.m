//
// Created by Milker on 2019-08-05.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "UIButton+MKYogaStyle.h"

@implementation UIButton (MKYogaStyle)

- (void)set_title:(id)value style:(NSDictionary *)style {
    [self setTitle:value forState:UIControlStateNormal];
}

- (void)set_titleFont:(id)value style:(NSDictionary *)style {
    [self.titleLabel setFont:[UIFont systemFontOfSize:[value floatValue]]];
}

- (void)set_titleBoldFont:(id)value style:(NSDictionary *)style {
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:[value floatValue]]];
}

- (void)set_titleColor:(id)value style:(NSDictionary *)style {
    [self setTitleColor:[MKYogaTransform transColor:value] forState:UIControlStateNormal];
}

- (void)set_bg:(id)value style:(NSDictionary *)style {
    [self setBGColor:[MKYogaTransform transColor:value] forState:UIControlStateNormal];
}

- (void)set_titleColor_highlight:(id)value style:(NSDictionary *)style {
    [self setTitleColor:[MKYogaTransform transColor:value] forState:UIControlStateHighlighted];
}

- (void)set_bg_highlight:(id)value style:(NSDictionary *)style {
    [self setBGColor:[MKYogaTransform transColor:value] forState:UIControlStateHighlighted];
}

- (void)set_titleColor_disabled:(id)value style:(NSDictionary *)style {
    [self setTitleColor:[MKYogaTransform transColor:value] forState:UIControlStateDisabled];
}

- (void)set_bg_disabled:(id)value style:(NSDictionary *)style {
    [self setBGColor:[MKYogaTransform transColor:value] forState:UIControlStateDisabled];
}

- (void)set_disabled:(id)value style:(NSDictionary *)style {
    self.enabled = ![value boolValue];
}


@end


@implementation UIButton (MPExt)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (void)setBGColor:(UIColor *)color forState:(UIControlState)state {
    UIImage *image = [UIButton imageWithColor:color];
    [self setBackgroundImage:image forState:state];
}

@end