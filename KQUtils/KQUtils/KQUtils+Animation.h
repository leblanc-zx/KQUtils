//
//  KQUtils+Animation.h
//  KangYunYouJia
//
//  Created by zhouxiang on 2020/12/28.
//  Copyright © 2020 kqdc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils (Animation)

/// 纵向移动
/// @param duration 时长
/// @param y y轴坐标
/// @param beiginTime 开始时间
- (CABasicAnimation *)moveY:(float)duration y:(NSNumber *)y beiginTime:(float)beiginTime;


/// 缩放
/// @param Multiple 比例
/// @param orginMultiple 原始比例
/// @param duration 时长
/// @param repeatCount 重复次数
/// @param beiginTime 开始时间
- (CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple duration:(float)duration repeatCount:(int)repeatCount beiginTime:(float)beiginTime;

/// 透明度
/// @param alpha 透明度
/// @param duration 时长
/// @param repeatCount 重复次数
/// @param beiginTime 开始时间
- (CABasicAnimation *)alpha:(NSNumber *)alpha duration:(float)duration repeatCount:(int)repeatCount beiginTime:(float)beiginTime;

/// 旋转
/// @param duration 时长
/// @param degree 学位
/// @param direction 方向
/// @param repeatCount 重复次数
- (CABasicAnimation *)rotationWithDuration:(float)duration degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;

/// 组合动画
/// @param animationArray 动画组
/// @param duration 时长
/// @param repeatCount 重复次数
- (CAAnimationGroup *)groupAnimation:(NSArray *)animationArray duration:(float)duration repeatCount:(float)repeatCount;

@end

NS_ASSUME_NONNULL_END
