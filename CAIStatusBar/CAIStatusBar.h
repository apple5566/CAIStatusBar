//
//  WTStatusBar.h
//  WTStatsBarShow
//
//  Created by WhiteGhost on 16/8/3.
//  Copyright © 2016年 阿里公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAIStatusBar : UIView

/***显示你文字和图片**/
+ (void)show:(NSString *)msg WithImage:(UIImage *)image1;

/**显示成功 */
+ (void)showSuccess:(NSString *)msg;

/***显示失败*/
+ (void)showErrow:(NSString *)msg;

/***显示正在下载中*/
+ (void)showLoad:(NSString *)msg;

/***显示隐藏状态条*/
+ (void)hide;



@end
