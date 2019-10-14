//
//  MKYoga.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MKNavigatorType) {
    MKNavigatorPush = 0,                    ///     常规push操作
    MKNavigatorPresent = 1,                 ///     使用present操作
    MKNavigatorPresentWithNavigation = 2    ///     使用present操作, vc 外层增加 UINavigatorController
};

@protocol MKYogaDelegate <NSObject>

// 加载图片的代理
- (void)mkYogaNetworkImageLoader:(UIView *)view value:(NSString *)value style:(NSDictionary *)style;
- (void)mkYogaNetworkImageLoader:(UIView *)view url:(NSString *)url placeholder:(NSString *)placeholder error:(NSString *)error;
// 路由跳转的代理
- (void)mkYogaRouterEvent:(UIView *)view value:(NSURL *)value;

@end

@interface MKYoga : NSObject<MKYogaDelegate>

@property (nonatomic, weak) id<MKYogaDelegate> delegate;

+ (instancetype)shareInstance;

/// 注册全局属性(重新注册会进行覆盖)
+ (void)registerStyleByFileName:(NSString *)fileName;
+ (void)registerStyle:(NSDictionary *)styles;

+ (NSDictionary *)styleWithName:(NSString *)name;
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;
+ (void)setDelegate:(id<MKYogaDelegate>) delegate;

@end

