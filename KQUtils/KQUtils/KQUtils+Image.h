//
//  KQUtils+Image.h
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019年 . All rights reserved.
//

#import "KQUtils.h"
#import <UIKit/UIKit.h>

@interface KQUtils (Image)

NS_ASSUME_NONNULL_BEGIN



/**
 压缩图片到指定文件大小(只压缩6次)
 
 @param image 目标图片
 @param size 目标大小（最大值)
 @param limit 限制次数：YES时只压缩6次，NO时一直压缩到压缩不动为止
 @return 返回的图片文件
 */
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size limit:(BOOL)limit;

/**
 给图片添加文字水印
 
 @param originalImage 目标图片
 @param text 文字
 @param point 位置
 @param attributed 文字的样式
 @return 水印图片
 */
- (UIImage *)waterImageWithOriginalImage:(UIImage *)originalImage text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed;

/**
 给图片添加文字水印
 
 @param originalImage 目标图片
 @param toSize 新图片尺寸
 @param text 文字
 @param point 位置
 @param attributed 文字的样式
 @param backgroundImage 背景图片
 @param backgroundRect 背景图片的位置
 @return 水印图片
 */
- (UIImage *)waterImageWithOriginalImage:(UIImage *)originalImage toSize:(CGSize)toSize text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed backgroundImage:(UIImage *)backgroundImage backgroundRect:(CGRect)backgroundRect;


/**
根据RGB颜色创建图片

@param color RGB颜色
@return 图片
*/
- (UIImage *)createImageWithColor:(UIColor *)color;

/// 根据给定的size的宽高比自动缩放原图片、自动判断截取位置,进行图片截取
/// @param image UIImage image 原始的图片
/// @param size CGSize size 截取图片的size
- (UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size;

/// 缓存图片
/// @param image 图片
/// @param key key
- (void)cacheImage:(UIImage *)image key:(NSString *)key;

NS_ASSUME_NONNULL_END

/// 获取缓存的图片
/// @param key key
/// @return 图片
- (UIImage * _Nullable)getCacheImageWithKey:(NSString * _Nonnull)key;

/// 获取默认图片（根据比例切割并缓存）
/// @param imageName 默认图片名称
/// @param ratio 比例
- (UIImage *_Nonnull)placeholderImage:(NSString *_Nonnull)imageName ratio:(CGSize)ratio;


@end
