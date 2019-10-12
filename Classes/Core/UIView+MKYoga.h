//
//  UIView+MKYoga.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/26.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYogaLayout.h"




@interface UIView (MKYoga)

@property(nonatomic, copy) NSDictionary *layout;


/**
 * 根据布局创建视图并返回
 * @param layout 布局结构
 * @param context 布局上下文，点击事件和视图注入将绑定到context上
 * @param style 局部样式表
 * @param data 数据
 * @return view instance
 */
+ (UIView *)createByLayout:(NSDictionary *)layout
                   context:(NSObject *)context
                     style:(NSDictionary *)style
                      data:(id)data;

+ (UIView *)createByLayout:(NSDictionary *)layout
                   context:(NSObject *)context;

+ (UIView *)createByLayout:(NSDictionary *)layout;


/**
 * 在rootView内创建子视图
 * @param layout 布局结构
 * @param rootView 根视图
 * @param context 布局上下文，点击事件和视图注入将绑定到context上
 * @param style 局部样式表
 * @param data 数据model
 */
+ (void)createSubViewsByLayout:(NSDictionary *)layout
                      rootView:(UIView *)rootView
                       context:(NSObject *)context
                         style:(NSDictionary *)style
                          data:(id)data;

+ (void)createSubViewsByLayout:(NSDictionary *)layout
                      rootView:(UIView *)rootView
                       context:(NSObject *)context;

+ (void)createSubViewsByLayout:(NSDictionary *)layout
                      rootView:(UIView *)rootView;


/**
 * 通过文件创建视图
 * @param layoutName 布局文件名，例如：welcome, 实际文件在工程内为 welcome.json
 * @param context context 布局上下文，点击事件和视图注入将绑定到context上
 * @param data 数据model
 * @return view instance
 */
+ (UIView *)createViewByLayoutName:(NSString *)layoutName
                           context:(NSObject *)context
                              data:(NSDictionary *)data;


#pragma mark - 数据更新

- (void)updateViewWithData:(id)data;

#pragma mark - 布局更新

- (void)applyLayout;

- (void)applyLayoutWidth;

- (void)applyLayoutHeight;

- (void)applyLayoutAll;

@end

