//
// Created by Milker on 2019/10/8.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MPDataBindViewController : UIViewController

@end


@interface MPDataModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSDictionary *info;

@end