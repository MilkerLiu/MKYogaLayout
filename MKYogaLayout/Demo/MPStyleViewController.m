//
// Created by Milker on 2019/10/11.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MPStyleViewController.h"
#import "MKYogaLayout.h"
#import "MKScreen.h"


@implementation MPStyleViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavbar];

    [MKYoga registerStyle:@{
            @"label_global": @{
                    kLFont: @18,
                    kLTextColor: @"#FF0000"
            }
    }];

    NSDictionary *style = @{
            @"style1": @{
                    kLFont: @22,
            }
    };

    NSDictionary *layout = @{
            kLPaddingTop: @(MKScreen.safeTop),
            kLBg: @"#FFFFFF",
            kLSubviews: @[
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"label_global",
                            kLText: @"全局样式表文字",
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"style1",
                            kLText: @"局部样式表文字",
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"label_global style1",
                            kLText: @"局部样式表+全局样式表 文字",
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"label_global style1",
                            kLText: @"局部样式表+全局样式表 文字(布局属性覆盖)",
                            kLTextColor: @"#00FF00"
                    }
            ]
    };
    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:style data:nil];
}

- (void)initNavbar {
    [self setTitle:@"Style"];
}

@end