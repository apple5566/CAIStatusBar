//
//  WTStatusBar.m
//  WTStatsBarShow
//
//  Created by WhiteGhost on 16/8/3.
//  Copyright © 2016年 阿里公司. All rights reserved.
//

#import "CAIStatusBar.h"
#define WTFont [UIFont systemFontOfSize:13]


@implementation CAIStatusBar

/**全局窗口*/
static UIWindow *window_;

/**定时器*/
static NSTimer *time_;

/**定时器的时间*/
static  CGFloat const WTDelayTime = 2;

/**动画的持续时间*/
static  CGFloat const WTAnimTime = 0.5;



+ (void)window
{
    window_.hidden = YES;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 20;
    CGRect frame = CGRectMake(0, -height, width, height);
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
   
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:WTAnimTime animations:^{
        window_.frame = frame;
    }];
}

/***显示你文字和图片**/
+ (void)show:(NSString *)msg WithImage:(UIImage *)image1
{
    // 停止定时器
    [time_ invalidate];
    // 显示窗口
    [self window];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = window_.bounds;
    
    [btn setTitle:msg forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    
    if (image1)
    {// 有图片
        [btn setImage:image1 forState:(UIControlStateNormal)];
         btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
   
    
    [window_ addSubview:btn];
    
    // 你显示好这个窗口就把它隐藏掉
    time_ = [NSTimer scheduledTimerWithTimeInterval:WTDelayTime target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**显示成功 */
+ (void)showSuccess:(NSString *)msg
{
    [self show:msg WithImage:[UIImage imageNamed:@"CAIStatusBar.bundle/success"]];
}

/***显示失败*/
+ (void)showErrow:(NSString *)msg
{
    [self show:msg WithImage:[UIImage imageNamed:@"CAIStatusBar.bundle/error"]];
}

/***显示正在下载中*/
+ (void)showLoad:(NSString *)msg
{
    // 停止定时器
    [time_ invalidate];
    time_ = nil;
    
    [self window];
    
    UILabel *textlabel = [[UILabel alloc] init];
    textlabel.frame = window_.bounds;
    textlabel.font = WTFont;
    textlabel.textAlignment = NSTextAlignmentCenter;
    textlabel.textColor = [UIColor whiteColor];
    textlabel.text = msg;
    [window_ addSubview:textlabel];
    
    UIActivityIndicatorView *indicat = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicat startAnimating];
    // 计算文字的长度
    CGSize msgSize = [msg sizeWithAttributes:@{NSFontAttributeName : WTFont}];
    CGFloat centerX = (window_.frame.size.width - msgSize.width) * 0.5 - 20;
    CGFloat centerY = window_.center.y;
    
    indicat.center = CGPointMake(centerX, centerY);
    // 开始动画
    
    [window_ addSubview:indicat];
    
   
    
}

/***显示隐藏状态条*/
+ (void)hide
{
    
    CGRect frame = window_.frame;
    frame.origin.y -= window_.frame.size.height ;
    
    [UIView animateWithDuration:0.5 animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        time_ = nil;
    }];
}

@end
