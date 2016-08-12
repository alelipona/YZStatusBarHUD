//
//  YZStatusBarHUD.h
//  状态栏指示器
//
//  Created by Yue on 8/11/16.
//  Copyright © 2016 fda. All rights reserved.
//  1.2.6. 版本号格式：大版本号.功能更新版本号.BUG修复版本号

//一旦增加新功能，功能版本号＋1，BUG修复版本号清0

#import <UIKit/UIKit.h>

@interface YZStatusBarHUD : NSObject

/**
 显示普通信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 * 显示普通信息和图片
 * @param msg: 文字
 * @param image: 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 隐藏
 */
+ (void)hide;
@end
