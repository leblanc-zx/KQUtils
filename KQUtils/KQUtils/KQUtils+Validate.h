//
//  KQUtils+Validate.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/7/10.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils (Validate)

/**
 手机号验证

 @param mobile 手机号
 @return BOOL
 */
- (BOOL)validateMobile:(NSString *)mobile;

/**
 验证身份证
 
 @param value 身份证号
 @return BOOL
 */
- (BOOL)validateIDCardNumber:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
