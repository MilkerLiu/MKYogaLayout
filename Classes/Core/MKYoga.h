//
//  MKYogo.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@protocol MKYogaDelegate <NSObject>

// 加载图片的代理
- (void)mkYogaNetworkImageLoader:(UIView *)view value:(NSString *)value style:(NSDictionary *)style;
// 路由跳转的代理
- (void)mkYogaRouterEvent:(UIView *)view value:(NSURL *)value;

@end

@interface MKYoga : NSObject

@property (nonatomic, weak) id<MKYogaDelegate> delegate;

+ (instancetype)shareInstance;

/// 注册全局属性(重新注册会进行覆盖)
+ (void)registerStyleByFileName:(NSString *)fileName;
+ (void)registerStyle:(NSDictionary *)styles;

+ (NSDictionary *)styleWithName:(NSString *)name;


+ (NSDictionary *)readLocalFileWithName:(NSString *)name;

@end

