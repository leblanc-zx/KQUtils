//
//  KQUtils+UIKit.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/7/9.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils (UIKit)

/**
 获取自适应size

 @param size size
 @param font font
 @param text text
 @return 适应的size
 */
- (CGSize)sizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text;

/**
 获取自适应size
 
 @param size size
 @param font font
 @param text text
 @param numberOfLines 行数
 @return 适应的size
 */
- (CGSize)sizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text numberOfLines:(int)numberOfLines;

/**
 获取自适应size
 
 @param size size
 @param font font
 @param text text
 @param numberOfLines 行数
 @param inset 边距
 @param lineFragmentPadding 左右边距
 @param linebreakMode 文字展示样式
 @return 适应的size
 */
- (CGSize)textViewSizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text numberOfLines:(int)numberOfLines textContainerInset:(UIEdgeInsets)inset lineFragmentPadding:(CGFloat)lineFragmentPadding lineBreakMode:(NSLineBreakMode)linebreakMode;

/**
添加圆角

@param view 添加圆角的视图
@param rect 大小
@param corners 哪些角
@param cornerRadius 圆角大小
*/
- (void)addCornerOnView:(UIView *)view rect:(CGRect)rect roundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;

/**
 绘制虚线
 
 @param lineView 绘制视图
 @param lineViewSize 视图的宽高
 @param lineLength 虚线宽
 @param lineSpacing 虚线间距
 @param lineColor 虚线颜色
 */
- (void)drawDashLine:(UIView *)lineView lineViewSize:(CGSize)lineViewSize lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;




- (CGSize)getAttributedStringHeight:(NSString*)strDes andSpaceWidth:(CGFloat)fWidth andFont:(UIFont*)font;



@end

NS_ASSUME_NONNULL_END
