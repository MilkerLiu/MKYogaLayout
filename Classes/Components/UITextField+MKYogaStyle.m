//
// Created by Milker on 2019/10/14.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "UITextField+MKYogaStyle.h"
#import "MKYogaTransform.h"


@implementation UITextField (MKYogaStyle)

- (void)set_padding:(id)value style:(NSDictionary *)style {
    self.yoga.padding = [MKYogaTransform transYGValue:value];

    float valueP = self.yoga.padding.value;
    if (valueP > 0) {
        [self setLeftPadding:valueP];
        [self setRightPadding:valueP];
    }
}

- (void)set_paddingLeft:(id)value style:(NSDictionary *)style {
    [self setLeftPadding:[value floatValue]];
}

- (void)set_paddingRight:(id)value style:(NSDictionary *)style {
    [self setRightPadding:[value floatValue]];
}

- (void)set_paddingHorizontal:(id)value style:(NSDictionary *)style {
    self.yoga.paddingHorizontal = [MKYogaTransform transYGValue:value];
    float valueP = self.yoga.paddingHorizontal.value;
    if (valueP > 0) {
         [self setLeftPadding:valueP];
         [self setRightPadding:valueP];
    }
}

- (void)setLeftPadding:(float)value {
    self.leftView = self.leftView ?: [UIView new];
    self.leftView.mk_width = value;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setRightPadding:(float)value {
    [self setValue:@(value) forKey:@"paddingRight"];
}

- (void)set_clearButtonMode:(id)value style:(NSDictionary *)style {
    self.clearButtonMode = (UITextFieldViewMode)[value integerValue];
}

- (void)set_placeholder:(id)value style:(NSDictionary *)style {
    self.placeholder = value;
}

@end