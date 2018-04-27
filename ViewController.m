//
//  ViewController.m
//  ZZZLayoutDemo
//
//  Created by ZML on 2018/4/27.
//  Copyright © 2018年 ZML. All rights reserved.
//

#import "ViewController.h"
#import "ZZZScreenLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //开启适配
    [[ZZZScreenLayout sharedInstance] setScreenScale];
    
    
    //假设 设计图是 以SCREEN_WIDTH_375 机型为标准   放置一排4个 80 * 80 的图标  间隔为11
    
    //ZZZLayout布局
    [self scaleTestView];
    
    //常规布局
    [self normalTestView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scaleTestView
{
    /*
     成比例缩放布局   会根据当前屏幕的比例 缩放到合适的布局  不影响整体布局效果
     这里只需要按照设计图做一次性布局即可，省心效果好，再也不用被设计妹妹吊咯
     */
    
    NSArray *strArr = @[@"清",@"热",@"解",@"毒"];
    
    for (int i = 0; i < 4; i ++) {
        
        UILabel *itemLabel = [self getTestLabel];
        itemLabel.backgroundColor = [UIColor orangeColor];
        itemLabel.frame = ZZRectMake(11 + (80 + 11) * i, 100, 80, 80);
        itemLabel.font = [UIFont systemFontOfSize:ZZLSC(30)];
        itemLabel.text = strArr[i];
    }
}

- (void)normalTestView
{
    //该方法下  320屏幕显示最明显，布局会完全乱掉
    NSArray *strArr = @[@"清",@"热",@"解",@"毒"];
    
    CGFloat space = (self.view.frame.size.width - 80 * 4) / 5;
    
    for (int i = 0; i < 4; i ++) {
        
        UILabel *itemLabel = [self getTestLabel];
        itemLabel.frame = CGRectMake(space + (80 + space) * i, 250, 80, 80);
        itemLabel.text = strArr[i];
    }
}


- (UILabel *)getTestLabel
{
    UILabel *itemLabel = [[UILabel alloc] init];
    itemLabel.textColor = [UIColor whiteColor];
    itemLabel.textAlignment = NSTextAlignmentCenter;
    itemLabel.font = [UIFont systemFontOfSize:30];
    itemLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:itemLabel];
    
    return itemLabel;
}


@end
