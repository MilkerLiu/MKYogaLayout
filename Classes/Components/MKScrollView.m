//
// Created by Milker on 2019-08-06.
//

#import <YogaKit/YGLayout.h>
#import "MKYogaTransform.h"

@implementation MKScrollView {
    UIView *_contentView;
}

- (UIView *)contentView {
    if (_contentView) {
        return _contentView;
    }
    self.delaysContentTouches = NO;
    _contentView = [UIView new];
    [_contentView configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
    }];
    [super addSubview:_contentView];
    return _contentView;
}

- (void)addSubview:(UIView *)view {
    [self.contentView addSubview:view];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentSize = [self contentView].bounds.size;
}

#pragma mark - Flex 属性
- (void)set_flexDirection:(id)value style:(NSDictionary *)style {
    YGFlexDirection direction = [MKYogaTransform transYGFlexDirection:value];
    self.contentView.yoga.flexDirection = direction;
    self.yoga.flexDirection = direction;
    self.yoga.alignItems = YGAlignStretch;
}
- (void)set_justifyContent:(id)value style:(NSDictionary *)style { self.contentView.yoga.justifyContent = [MKYogaTransform transYGJustify:value]; }
- (void)set_alignContent:(id)value style:(NSDictionary *)style { self.contentView.yoga.alignContent = [MKYogaTransform transYGAlign:value]; }
- (void)set_alignItems:(id)value style:(NSDictionary *)style { self.contentView.yoga.alignItems = [MKYogaTransform transYGAlign:value]; }

- (void)set_padding:(id)value style:(NSDictionary *)style { self.contentView.yoga.padding = [MKYogaTransform transYGValue:value]; }
- (void)set_paddingLeft:(id)value style:(NSDictionary *)style { self.contentView.yoga.paddingLeft = [MKYogaTransform transYGValue:value]; }
- (void)set_paddingRight:(id)value style:(NSDictionary *)style { self.contentView.yoga.paddingRight = [MKYogaTransform transYGValue:value]; }
- (void)set_paddingBottom:(id)value style:(NSDictionary *)style { self.contentView.yoga.paddingBottom = [MKYogaTransform transYGValue:value]; }

- (void)set_sc_bounces:(id)value style:(NSDictionary *)style { self.bounces = [value boolValue]; }
- (void)set_sc_paging:(id)value style:(NSDictionary *)style { self.pagingEnabled = [value boolValue]; }
- (void)set_sc_showsHorizontalScrollIndicator:(id)value style:(NSDictionary *)style { self.showsHorizontalScrollIndicator = [value boolValue]; }
- (void)set_sc_showsVerticalScrollIndicator:(id)value style:(NSDictionary *)style { self.showsVerticalScrollIndicator = [value boolValue]; }


@end