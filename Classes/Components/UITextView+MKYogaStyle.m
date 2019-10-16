//
// Created by Milker on 2019-09-02.
//

#import "UITextView+MPlaceholder.h"
#import "UITextView+MKYogaStyle.h"


@implementation UITextView (MKYogaStyle)

- (void)set_placeholder:(id)value style:(NSDictionary *)style {
    self.placeholder = value;
}

- (void)set_placeholderColor:(id)value style:(NSDictionary *)style {
    self.placeholderColor = [MKYogaTransform transColor:value];
}

- (void)set_textColor:(id)value style:(NSDictionary *)style {
    self.textColor = [MKYogaTransform transColor:value];
}

- (void)set_font:(id)value style:(NSDictionary *)style {
    self.font = [UIFont systemFontOfSize:[value floatValue]];
}

- (void)set_boldFont:(id)value style:(NSDictionary *)style {
    self.font = [UIFont boldSystemFontOfSize:[value floatValue]];
}

- (void)set_textContainerInset:(id)value style:(NSDictionary *)style {
    UIEdgeInsets inset = self.textContainerInset;
    if ([value isKindOfClass:[NSString class]]) {
        // 多值
        NSArray *items = [value componentsSeparatedByString:@" "];
        if (items.count == 1) {
            CGFloat v = [items[0] floatValue];
            inset.top = inset.bottom = inset.left = inset.right = v;
        } else if (items.count == 2) {
            CGFloat v1 = [items[0] floatValue];
            CGFloat v2 = [items[1] floatValue];

            inset.top = inset.bottom = v1;
            inset.left = inset.right = v2;
        } else if (items.count == 4) {
            inset.top = [items[0] floatValue];
            inset.left = [items[1] floatValue];
            inset.bottom = [items[2] floatValue];
            inset.right = [items[3] floatValue];
        }
    } else {
        // 单圆角
        inset.top = inset.bottom = inset.left = inset.right = [value floatValue];
    }
    self.textContainerInset = inset;
}

@end