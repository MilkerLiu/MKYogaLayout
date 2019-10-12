//
// Created by Milker on 2019/10/8.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MPSimpleLayoutViewController.h"
#import "MKScreen.h"
#import "MKYogaLayout.h"


@implementation MPSimpleLayoutViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavbar];

    NSDictionary *layout = @{
            kLPaddingTop: @(MKScreen.safeTop),
            kLBg: @"#FFFFFF",
            kLSubviews: @[
                    [self group1],
                    [self divider],
                    [self group2],
                    [self divider],
            ]
    };

    [UIView createSubViewsByLayout:layout rootView:self.view context:self];
}

- (void)initNavbar {
    [self setTitle:@"Simple Layout"];
}

#pragma mark - views

- (NSDictionary *)divider {
    return @{
            kLView: UIView.class,
            kLBg: @"#eeeeee",
            kLHeight: @2
    };
}

- (NSDictionary *)group1 {
    return @{
            kLView: UIView.class,
            kLBg: @"#FFFFFF",
            kLPadding: @10,
            kLSubviews: @[
                    @{
                            kLView: UIView.class,
                            kLFlexDirection: @(YGFlexDirectionRow),
                            kLAlignItems: @(YGAlignCenter),
                            kLSubviews: @[
                            @{
                                    kLView: UIView.class,
                                    kLWidth: @40,
                                    kLHeight: @40,
                                    kLCorner: @20,
                                    kLBg: @"#FFCC99"
                            },
                            @{
                                    kLView: UILabel.class,
                                    kLText: @"Milker",
                                    kLFlexGrow: @1,
                                    kLFlexShrink: @1,
                                    kLBoldFont: @17,
                                    kLMarginLeft: @10
                            },
                            @{
                                    kLView: UILabel.class,
                                    kLTextColor: @"#CCCCCC",
                                    kLFont: @13,
                                    kLText: @"19/10/10",
                            }
                    ]
                    },
                    @{
                            kLView: UILabel.class,
                            kLMarginTop: @10,
                            kLFont: @16,
                            kLText: @"把读书当成长，你就会勤奋努力；把奉献当快乐，你就会慷慨助人。有的人不管年纪多大，却永远年轻；有的人不管是荣是辱，却波澜不惊；有的人不管是富是贫，却朴实为人。",
                            kLMaxLines: @2,
                    },
                    @{
                            kLView: UIView.class,
                            kLMarginTop: @10,
                            kLFlexDirection: @(YGFlexDirectionRow),
                            kLSubviews: @[
                            @{
                                    kLView: UIView.class,
                                    kLHeight: @100,
                                    kLFlexGrow: @1,
                                    kLBg: @"#FFCCCC"
                            },
                            @{
                                    kLView: UIView.class,
                                    kLHeight: @100,
                                    kLMarginHorizontal: @10,
                                    kLFlexGrow: @1,
                                    kLBg: @"#FFCCCC"
                            },
                            @{
                                    kLView: UIView.class,
                                    kLHeight: @100,
                                    kLFlexGrow: @1,
                                    kLBg: @"#FFCCCC"
                            }
                    ]
                    }]
    };
}

- (NSDictionary *)group2 {
    return @{
            kLView: UIView.class,
            kLFlexDirection: @(YGFlexDirectionRow),
            kLAlignItems: @(YGAlignCenter),
            kLSubviews: @[
                    @{
                            kLView: UIView.class,
                            kLHeight: @80,
                            kLWidth: @80,
                            kLCorner: @40,
                            kLMargin: @20,
                            kLBg: @"FFCC99"
                    },
                    @{
                            kLView: UIView.class,
                            kLBg: @"#eeeeee",
                            kLHeight: @"80%",
                            kLWidth: @1
                    },
                    @{
                            kLView: UIView.class,
                            kLFlexGrow: @1,
                            kLPaddingLeft: @20,
                            kLSubviews: @[
                            @{
                                    kLView: UILabel.class,
                                    kLFont: @22,
                                    kLText: @"Good Morning!",
                            },
                            @{
                                    kLView: UILabel.class,
                                    kLFont: @24,
                                    kLTextColor: @"99CCFF",
                                    kLText: @"HK8899",
                            },
                            @{
                                    kLView: UIView.class,
                                    kLFlexDirection: @(YGFlexDirectionRow),
                                    kLAlignItems: @(YGAlignFlexEnd),
                                    kLSubviews: @[
                                    @{
                                            kLView: UILabel.class,
                                            kLFont: @14,
                                            kLTextColor: @"CCCCCC",
                                            kLMarginBottom: @3,
                                            kLText: @"账户余额：",
                                    },
                                    @{
                                            kLView: UILabel.class,
                                            kLFont: @22,
                                            kLTextColor: @"FF6666",
                                            kLMarginHorizontal: @6,
                                            kLText: @"8.8",
                                    },
                                    @{
                                            kLView: UILabel.class,
                                            kLTextColor: @"CCCCCC",
                                            kLMarginBottom: @3,
                                            kLFont: @14,
                                            kLText: @"RMB",
                                            kLMaxLines: @2
                                    }]
                            }
                    ]
                    }
            ]
    };
}
@end