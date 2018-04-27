//
//  ZZZScreenLayout.h
//  ZZZLayout
//
//  Created by ZML on 2018/4/26.
//  Copyright © 2018年 ZML. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark - 屏幕宽-逻辑分辨率

//3GS 4 4S  5  5C  5S  5SE
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_320;

//6  6S  7  8  X
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_375;

//6Plus  6SPlus  7Plus  8Plus
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_414;




@interface ZZZScreenLayout : NSObject

/**
 * 标准宽度  默认为SCREEN_WIDTH_375
 */
@property (nonatomic, assign)CGFloat standardScreen;

/**
 *  比例系数
 */
@property (nonatomic, assign ,readonly)CGFloat zzzScaleC;

/**
 * 初始化比例系数  一句代码开启适配
 */
- (void)setScreenScale;

+ (instancetype)sharedInstance;

@end

/**
 *  单个固定值调整
 */
static inline CGFloat
ZZLSC (CGFloat C)
{
    return [ZZZScreenLayout sharedInstance].zzzScaleC * (C);
}

static inline CGRect
ZZRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * [ZZZScreenLayout sharedInstance].zzzScaleC;
    rect.origin.y = y * [ZZZScreenLayout sharedInstance].zzzScaleC;
    rect.size.width = width * [ZZZScreenLayout sharedInstance].zzzScaleC;
    rect.size.height = height * [ZZZScreenLayout sharedInstance].zzzScaleC;
    return rect;
}


