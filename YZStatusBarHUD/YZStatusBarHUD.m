//
//  YZStatusBarHUD.m
//  状态栏指示器
//
//  Created by Yue on 8/11/16.
//  Copyright © 2016 fda. All rights reserved.
//

#import "YZStatusBarHUD.h"

#define YZMessageFont [UIFont systemFontOfSize:14]
static CGFloat const YZMessageDuration = 2.0; //消息显示的时长
static CGFloat const YZAnimationDuration = 0.25; //动画时长

@implementation YZStatusBarHUD
static UIWindow *window_; //全局的窗口
static NSTimer *timer_;

/**
 显示窗口
 */
+ (void)showWindow
{
    CGFloat windowH = 30;
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示窗口
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert; //级别最高的window，会盖住状态栏
    window_.frame = frame;
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:YZAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:msg forState:UIControlStateNormal];
    btn.titleLabel.font = YZMessageFont;
    if (image) { //如果有图片
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    btn.frame = window_.bounds;
    [window_ addSubview:btn];
    
    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YZMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"YZStatusBarHUD.bundle/success"]]; //image用bundle包装起来可以避免项目中的image和框架中的资源重名
}

+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"YZStatusBarHUD.bundle/error"]];
}

+ (void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UILabel *label = [[UILabel alloc] init];
    label.font = YZMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加显示正在加载的圈圈图
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : YZMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 15;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center  = CGPointMake(centerX, centerY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
}

+ (void)hide
{
    [UIView animateWithDuration:YZAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
    }];
}
@end
