//
// Created by Milker on 2019/10/14.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MPTextInputViewController.h"
#import "MKYogaLayout.h"
#import "MKScreen.h"


@implementation MPTextInputViewController {

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
                            kLView: UITextField.class,
                            kLMarginTop: @20,
                            kLPadding: @10,
                            kLClearButtonMode: @(UITextFieldViewModeWhileEditing),
                            kLPlaceHolder: @"哈哈哈",
                            kLCorner: @10,
                            kLBg: @"FF0000"
                    },
                    @{
                            kLView: UITextView.class,
                            kLMarginTop: @20,
                            kLPadding: @20,
                            kLFont: @20,
                            kLTextContainerInset: @"10",
                            kLPlaceHolder: @"哈哈哈",
                            kLCorner: @10,
                            kLBg: @"FF0000"
                    }
            ]
    };


    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:nil];
}

- (void)initNavbar {
    [self setTitle:@"Input"];
}
@end