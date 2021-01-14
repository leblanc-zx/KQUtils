//
//  KQUtils+Image.m
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019年 . All rights reserved.
//

#import "KQUtils+Image.h"
#include <OpenGLES/ES1/glext.h>

@implementation KQUtils (Image)

/// 压缩图片到指定文件大小(只压缩6次)
/// @param image 目标图片
/// @param size 目标大小（最大值)
/// @param limit 限制次数：YES时只压缩6次，NO时一直压缩到压缩不动为止
/// @return 返回的图片文件
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size limit:(BOOL)limit {
    if (limit) {
        // 只压缩6次
        CGFloat compression = 1;
        NSData *data = UIImageJPEGRepresentation(image, compression);
        if (data.length < size) return data;
        
        CGFloat max = 1;
        CGFloat min = 0;
        for (int i = 0; i < 6; ++i) {
            compression = (max + min) / 2;
            data = UIImageJPEGRepresentation(image, compression);
            if (data.length < size * 0.9) {
                min = compression;
            } else if (data.length > size) {
                max = compression;
            } else {
                break;
            }
        }
        return data;
    } else {
        // 一直压缩到压缩不动
        NSData * data = UIImageJPEGRepresentation(image, 1.0);
        CGFloat dataKBytes = data.length/1000.0;
        CGFloat maxQuality = 0.9f;
        CGFloat lastData = dataKBytes;
        while (dataKBytes > size && maxQuality > 0.01f) {
            maxQuality = maxQuality - 0.01f;
            data = UIImageJPEGRepresentation(image, maxQuality);
            dataKBytes = data.length / 1000.0;
            if (lastData == dataKBytes) {
                break;
            }else{
                lastData = dataKBytes;
            }
        }
        return data;
    }
}

/**
 给图片添加文字水印

 @param originalImage 目标图片
 @param text 文字
 @param point 位置
 @param attributed 文字的样式
 @return 水印图片
 */
- (UIImage *)waterImageWithOriginalImage:(UIImage *)originalImage text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed {
    return [self waterImageWithOriginalImage:originalImage toSize:CGSizeMake(originalImage.size.width, originalImage.size.height) text:text textPoint:point attributedString:attributed backgroundImage:nil backgroundRect:CGRectZero];
}

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
- (UIImage *)waterImageWithOriginalImage:(UIImage *)originalImage toSize:(CGSize)toSize text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed backgroundImage:(UIImage *)backgroundImage backgroundRect:(CGRect)backgroundRect {
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(toSize, NO, 0);
    //2.绘制图片
    [originalImage drawInRect:CGRectMake(0, 0, toSize.width, toSize.height)];
    //添加背景
    if (backgroundImage) {
        [backgroundImage drawInRect:backgroundRect];
    }
    //添加水印文字
    if (text.length > 0) {
        [text drawAtPoint:point withAttributes:attributed];
    }
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

/**
根据RGB颜色创建图片

@param color RGB颜色
@return 图片
*/
- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}


/**
 *根据给定的size的宽高比自动缩放原图片、自动判断截取位置,进行图片截取
 * UIImage image 原始的图片
 * CGSize size 截取图片的size
 */
- (UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size {

    //被切图片宽比例比高比例小 或者相等，以图片宽进行放大
    if (image.size.width*size.height <= image.size.height*size.width) {
        
        //以被剪裁图片的宽度为基准，得到剪切范围的大小
        CGFloat width  = image.size.width;
        CGFloat height = image.size.width * size.height / size.width;
       
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [self imageFromImage:image inRect:CGRectMake(0, (image.size.height -height)/2, width, height)];
        
    }else{ //被切图片宽比例比高比例大，以图片高进行剪裁
        
        // 以被剪切图片的高度为基准，得到剪切范围的大小
        CGFloat width  = image.size.height * size.width / size.height;
        CGFloat height = image.size.height;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [self imageFromImage:image inRect:CGRectMake((image.size.width -width)/2, 0, width, height)];
    }
    return nil;
}

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
- (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [image CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    
    //返回剪裁后的图片
    return newImage;
}

/// 缓存图片
/// @param image 图片
/// @param key key
- (void)cacheImage:(UIImage *)image key:(NSString *)key {
    NSDictionary *dic = @{@"image": image,
                          @"key": key};
    for (NSDictionary *oldDic in self.cacheImageList) {
        if ([[oldDic objectForKey:@"key"] isEqualToString:key]) {
            [self.cacheImageList removeObject:oldDic];
            break;
        }
    }
    [self.cacheImageList addObject:dic];
}

/// 获取缓存的图片
/// @param key key
/// @return 图片
- (UIImage * _Nullable)getCacheImageWithKey:(NSString * _Nonnull)key {
    for (NSDictionary *oldDic in self.cacheImageList) {
        if ([[oldDic objectForKey:@"key"] isEqualToString:key]) {
            return [oldDic objectForKey:@"image"];
        }
    }
    return nil;
}

/// 获取默认图片（根据比例切割并缓存）
/// @param imageName 默认图片名称
/// @param ratio 比例
- (UIImage *_Nonnull)placeholderImage:(NSString *_Nonnull)imageName ratio:(CGSize)ratio {
    
    CGFloat w = ratio.width;
    CGFloat h = ratio.height;
    if (ratio.width == 0 || ratio.height == 0) {
        w = 1;
        h = 1;
    }
    
    NSString *key = [NSString stringWithFormat:@"placeholder_w:%lf_h:%lf", w, h];
    UIImage *cacheImage = [[KQUtils shared] getCacheImageWithKey:key];
    if (cacheImage != nil) {
        return cacheImage;
    } else {
        UIImage *image = [[KQUtils shared] clipImage:[UIImage imageNamed:imageName] toRect:CGSizeMake(w, h)];
        [[KQUtils shared] cacheImage:image key:key];
        return image;
    }
    
}

@end
