//
//  UIImageView+MKYogaStyle.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "UIImageView+MKYogaStyle.h"

@implementation UIImageView (MKYogaStyle)

- (void)set_image:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:NSDictionary.class]) {
        NSString *url = value[kLImageUrl];
        NSString *placeholder = value[kLImagePlaceHolder];
        NSString *error = value[kLImageError];
        [[MKYoga shareInstance] mkYogaNetworkImageLoader:self url:url placeholder:placeholder error:error];
    } else if ([value isKindOfClass:NSString.class]) {
        if ([value hasPrefix:@"http"]) {
            [[MKYoga shareInstance] mkYogaNetworkImageLoader:self value:value style:style];
        } else  {
            self.image = [UIImage imageNamed:value];
        }
    }
}

- (void)set_imagePath:(id)value style:(NSDictionary *)style {
    if ([value hasPrefix:@"http"]) {
        [[MKYoga shareInstance].delegate mkYogaNetworkImageLoader:self value:value style:style];
    } else {
        self.image = [UIImage imageNamed:value];
    }
}

- (void)set_imageName:(id)value style:(NSDictionary *)style {
    self.image = [UIImage imageNamed:value];
}

- (void)set_contentMode:(id)value style:(NSDictionary *)style {
    self.contentMode = [value integerValue];
}

- (void)set_placeholder:(id)value style:(NSDictionary *)style {
    self.image = [UIImage imageNamed:value];
}

@end
