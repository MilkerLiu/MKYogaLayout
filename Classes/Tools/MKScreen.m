//
// Created by Milker on 2019/10/8.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "MKScreen.h"


@implementation MKScreen {

}
+ (CGFloat)statusBarHeight {
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}

+ (CGFloat)navigatorBarHeight {
    // if you use custom navbar, return your navbar height
    return 44;
}

+ (CGFloat)safeTop {
    return self.statusBarHeight + self.navigatorBarHeight;
}


@end