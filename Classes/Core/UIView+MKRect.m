//
// Created by Milker on 2019/10/15.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "UIView+MKRect.h"


@implementation UIView (MKRect)

- (CGFloat)mk_width {
    return self.frame.size.width;
}

- (void)setMk_width:(CGFloat)mkWidth {
    CGRect frame = self.frame;
    frame.size.width = mkWidth;
    self.frame = frame;
}


@end