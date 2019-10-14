//
// Created by Milker on 2019/10/12.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MPLabelViewController.h"
#import "MKYogaLayout.h"
#import "MKScreen.h"
#import "MPDataBindViewController.h"


@implementation MPLabelViewController {
    MPDataModel *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavbar];

    NSDictionary *layout = @{
            kLPaddingTop: @(MKScreen.safeTop),
            kLBg: @"#FFFFFF",
            kLPadding: @20,
            kLSubviews: @[
                    @{
                            kLView: UILabel.class,
                            kLMarginTop: @20,
                            kLText: @"要主动做点事情让死水一样的生活发生变化，砸块石头，送生活一朵浪花。可以不光芒万丈，但不能停止自己发光。",
                            kLMaxLines: @1,
                    },
                    @{
                            kLView: UILabel.class,
                            kLMarginTop: @20,
                            kLText: @"要主动做点事情让死水一样的生活发生变化，砸块石头，送生活一朵浪花。可以不光芒万丈，但不能停止自己发光。",
                            kLMaxLines: @2,
                    },
                    @{
                            kLView: UILabel.class,
                            kLMarginTop: @20,
                            kLBg: @"#FFCC99",
                            kLAttributeText:
                            @{
                                    kLFont: @18,
                                    kLTextColor: @"FF0000",
                                    kLLineBreakMode: @(NSLineBreakByTruncatingTail),
                                    kLAttributeTextLineSpace: @10,
                                    kLText: @"要主动做点事情让死水一样的生活发生变化，砸块石头，送生活一朵浪花。可以不光芒万丈，但不能停止自己发光。",
                            },
                            kLMaxLines: @2,
                    },
            ]
    };

    model = [MPDataModel new];
    model.title = @"Milker";
    model.age = 12;
    model.info = @{
            @"school": @{
                    @"name": @"MIT",
                    @"address": @"USA"
            }
    };
    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:model];
}

- (void)initNavbar {
    [self setTitle:@"Text"];
}

@end