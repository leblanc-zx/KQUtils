//
//  KQUtils.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/7/9.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils : NSObject

+ (KQUtils *)shared;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSMutableArray <NSDictionary*> *cacheImageList;//image,key

/// 获取默认头像图片
/// @param sex  性别  1：男  2：女
- (UIImage *)placeholderheaderImageWithSex:(NSInteger)sex;

/// 字符串移除小数点后面的无效0
/// @param string 结果
- (nullable NSString *)stringRemovePointZero:(nullable NSString *)string;

/// 加密
/// @param string 加密前字符串
/// @param key 秘钥
/// @return base64编码
- (NSString *)encryptWithString:(NSString *)string key:(NSString *)key;

/// 解密
/// @param string 解密前base64编码
/// @param key 秘钥
/// @return 解密字符串
- (NSString *)decryptWithString:(NSString *)string key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
