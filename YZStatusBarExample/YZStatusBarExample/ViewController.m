//
//  ViewController.m
//  状态栏指示器
//
//  Created by Yue on 8/11/16.
//  Copyright © 2016 fda. All rights reserved.
//

#import "ViewController.h"
#import "YZStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)message:(id)sender
{
    [YZStatusBarHUD showMessage:@"Nothing..."];
}

- (IBAction)success:(id)sender
{
    [YZStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender
{
    [YZStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender
{
    [YZStatusBarHUD showLoading:@"正在加载中。。。"];
}

- (IBAction)hide:(id)sender
{
    [YZStatusBarHUD hide];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [YZStatusBarHUD showSuccess:@"加载成功"];
    [YZStatusBarHUD showError:@"加载失败"];
    [YZStatusBarHUD showLoading:@"正在加载中。。。"];
}

@end
