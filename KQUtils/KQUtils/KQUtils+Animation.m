//
//  KQUtils+Animation.m
//  KangYunYouJia
//
//  Created by zhouxiang on 2020/12/28.
//  Copyright © 2020 kqdc. All rights reserved.
//

#import "KQUtils+Animation.h"

@implementation KQUtils (Animation)


/// 纵向移动
/// @param duration 时长
/// @param y y轴坐标
/// @param beiginTime 开始时间
- (CABasicAnimation *)moveY:(float)duration y:(NSNumber *)y beiginTime:(float)beiginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.beginTime = beiginTime;
    
    animation.toValue = y;
    
    animation.duration = duration;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


/// 缩放
/// @param Multiple 比例
/// @param orginMultiple 原始比例
/// @param duration 时长
/// @param repeatCount 重复次数
/// @param beiginTime 开始时间
- (CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple duration:(float)duration repeatCount:(int)repeatCount beiginTime:(float)beiginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.beginTime = beiginTime;
    
    animation.fromValue = orginMultiple;
    animation.toValue = Multiple;
    
    animation.duration = duration;
    
    animation.autoreverses = NO;
    
    animation.repeatCount = repeatCount;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}

/// 透明度
/// @param alpha 透明度
/// @param duration 时长
/// @param repeatCount 重复次数
/// @param beiginTime 开始时间
- (CABasicAnimation *)alpha:(NSNumber *)alpha duration:(float)duration repeatCount:(int)repeatCount beiginTime:(float)beiginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.beginTime = beiginTime;
    
    animation.toValue = alpha;
    
    animation.duration = duration;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.repeatCount = repeatCount;
    
    return animation;
    
}


/// 旋转
/// @param duration 时长
/// @param degree 学位
/// @param direction 方向
/// @param repeatCount 重复次数
- (CABasicAnimation *)rotationWithDuration:(float)duration degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount {
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0,direction);
    CABasicAnimation *animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration = duration;
    
    animation.autoreverses = NO;
    
    animation.cumulative = YES;
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.repeatCount = repeatCount;
    
    //animation.delegate= self;
    
    return animation;
    
}


/// 组合动画
/// @param animationArray 动画组
/// @param duration 时长
/// @param repeatCount 重复次数
- (CAAnimationGroup *)groupAnimation:(NSArray *)animationArray duration:(float)duration repeatCount:(float)repeatCount {
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    
    animation.animations = animationArray;
    
    animation.duration = duration;
    
    animation.repeatCount = repeatCount;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}

@end
