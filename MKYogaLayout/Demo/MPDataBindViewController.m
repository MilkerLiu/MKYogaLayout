//
// Created by Milker on 2019/10/8.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MPDataBindViewController.h"
#import "MKYogaLayout.h"
#import "MKScreen.h"


@implementation MPDataBindViewController {
    MPDataModel *model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavbar];

    NSDictionary *layout = @{
            kLPaddingTop: @(MKScreen.safeTop),
            kLBg: @"#FFFFFF",
            kLSubviews: @[
                    @{
                            kLView: UIView.class,
                            kLFlexDirection: @(YGFlexDirectionRow),
                            kLSubviews: @[
                            @{
                                    kLView: UILabel.class,
                                    kLText: @"{{title}}",
                                    kLMarginLeft: @20,
                            },
                            @{
                                    kLView: UILabel.class,
                                    kLText: @"{{age}}",
                                    kLMarginLeft: @20,
                            },
                            @{
                                    kLView: UILabel.class,
                                    kLText: @"{{info.school.name}}",
                                    kLMarginLeft: @20,
                            },
                    ]
                    },
                    @{
                            kLView: UILabel.class,
                            kLPadding: @10,
                            kLBindTap: @"updateAge",
                            kLTextAlignment: @(NSTextAlignmentCenter),
                            kLAlignSelf: @(YGAlignCenter),
                            kLMarginTop: @40,
                            kLText: @"Age + 1",
                            kLBg: @"#99CCCC",
                            kLBg_Highlight: @"#0099CC"
                    }
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
    [self setTitle:@"MKYogaLayout"];
}

- (void)updateAge:(id)sender {
    model.age += 1;
    [self.view updateViewWithData:model];
}

@end

@implementation MPDataModel {
}
@end