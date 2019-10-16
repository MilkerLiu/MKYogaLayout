//
// Created by Milker on 2019-09-02.
//

#import <Foundation/Foundation.h>

#import "MKYogaLayout.h"

#pragma mark - Attrs

static const NSString *kLPlaceholder = @"placeholder";                  /// 占位文字
static const NSString *kLPlaceholderColor = @"placeholderColor";        /// 占位文字颜色
static const NSString *kLTextContainerInset = @"textContainerInset";    /// 文字内边距，10， "10 10 10 10" （top, left, bottom. right）

@interface UITextView (MKYogaStyle)
@end