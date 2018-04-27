//
//  ZZZScreenLayout.m
//  ZZZLayout
//
//  Created by ZML on 2018/4/26.
//  Copyright © 2018年 ZML. All rights reserved.
//

#import "ZZZScreenLayout.h"

CGFloat const SCREEN_WIDTH_320 = 320.f;
CGFloat const SCREEN_WIDTH_375 = 375.f;
CGFloat const SCREEN_WIDTH_414 = 414.f;


@implementation ZZZScreenLayout

+ (instancetype)sharedInstance
{
    static ZZZScreenLayout *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] init];
        sharedInstance.standardScreen = SCREEN_WIDTH_375;
    });
    
    return sharedInstance;
}

- (void)setScreenScale
{
    CGFloat nowScreenWidth = [UIScreen mainScreen].bounds.size.width;
    _zzzScaleC = nowScreenWidth / self.standardScreen;
}

@end
