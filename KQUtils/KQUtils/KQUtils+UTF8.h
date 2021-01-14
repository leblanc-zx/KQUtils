//
//  KQUtils+UTF8.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/9/9.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils (UTF8)

/**
 data转UTF8String
 
 @param data NSData
 @return UTF8String
 */
- (NSString *)UTF8StringWithData:(NSData *)data;

- (NSData *)UTF8DataWithOriginData:(NSData *)originData;

/**
 string转UTF8Data

 @param string NSString
 @return UTF8Data
 */
- (NSData *)UTF8DataWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
