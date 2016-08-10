//
//  ViewController.m
//  CAIStatusBarExemple
//
//  Created by WhiteGhost on 16/8/4.
//  Copyright © 2016年 阿里公司. All rights reserved.
//

#import "ViewController.h"
#import "CAIStatusBar.h"

@interface ViewController ()

@end

@implementation ViewController



/**显示 */
- (IBAction)show {
    
    [CAIStatusBar show:@"牛逼" WithImage:nil];
}

/**显示成功*/
- (IBAction)success {
    
    [CAIStatusBar showSuccess:@"加载完成"];
}

/**显示失败*/
- (IBAction)failed {
    
    [CAIStatusBar showErrow:@"加载失败了"];
}

/***显示加载*/
- (IBAction)loading {
    
    [CAIStatusBar showLoad:@"正在加载中"];
}

/**显示隐藏*/
- (IBAction)hide {
    
    [CAIStatusBar hide];
}

- (void)showxxx
{
    
}

@end
