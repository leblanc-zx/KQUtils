//
//  KQUtils.m
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/7/9.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils.h"
#import "NSString+KQEncryption.h"

@implementation KQUtils

static id _instace;

- (id)init
{
    static id obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ((obj = [super init])) {
            
        }
    });
    self = obj;
    return self;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (KQUtils *)shared
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    
    return _instace;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
    }
    return _textView;
}

- (NSMutableArray<NSDictionary *> *)cacheImageList {
    if (!_cacheImageList) {
        _cacheImageList = [[NSMutableArray alloc] init];
    }
    return  _cacheImageList;
}

/// 获取默认头像图片
/// @param sex  性别  1：男  2：女
- (UIImage *)placeholderheaderImageWithSex:(NSInteger)sex {
    if (sex == 1) {
        //男
        return [UIImage imageNamed:@"my_touxiang_man.png"];
    } else {
        //女
        return [UIImage imageNamed:@"my_touxiang_woman.png"];
    }
}

/// 字符串移除小数点后面的无效0
/// @param string 结果
- (nullable NSString *)stringRemovePointZero:(nullable NSString *)string {
    NSArray *array = [string componentsSeparatedByString:@"."];
    if (array.count == 2) {
        NSString *firstString = array.firstObject;
        NSString *lastString = array.lastObject;
        while (lastString.length > 0) {
            if ([lastString hasSuffix:@"0"]) {
                lastString = [lastString substringToIndex:lastString.length-1];
            } else {
                break;
            }
        }
        if (lastString.length > 0) {
            return [NSString stringWithFormat:@"%@.%@",firstString, lastString];
        } else {
            return firstString;
        }
    } else {
        return string;
    }
}

/// 加密
/// @param string 加密前字符串
/// @param key 秘钥 
/// @return base64编码
- (NSString *)encryptWithString:(NSString *)string key:(NSString *)key {
    //return [string aesECBEncryptWithKey:key];
    return string;
}

/// 解密
/// @param string 解密前base64编码
/// @param key 秘钥
/// @return 解密字符串
- (NSString *)decryptWithString:(NSString *)string key:(NSString *)key {
    //return [string aesECBBase64StringDecryptWithKey:key];
    return string;
}

@end
