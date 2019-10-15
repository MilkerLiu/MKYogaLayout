//
// Created by Milker on 2019/10/15.
// Copyright (c) 2019 Milker. All rights reserved.
//

#if __has_feature(modules)
@import UIKit;
#else
#import <UIKit/UIKit.h>
#endif

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (MPlaceholder)

@property (nonatomic, readonly) UITextView *placeholderTextView NS_SWIFT_NAME(placeholderTextView);

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end