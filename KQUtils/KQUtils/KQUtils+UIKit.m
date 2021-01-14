//
//  KQUtils+UIKit.m
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/7/9.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils+UIKit.h"

@implementation KQUtils (UIKit)

/**
 获取自适应size
 
 @param size size
 @param font font
 @param text text
 @return 适应的size
 */
- (CGSize)sizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text {
    return [self sizeThatFits:size font:font text:text numberOfLines:0];
}

/**
 获取自适应size
 
 @param size size
 @param font font
 @param text text
 @param numberOfLines 行数
 @return 适应的size
 */
- (CGSize)sizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text numberOfLines:(int)numberOfLines {
    
    self.label.font = font;
    self.label.numberOfLines = numberOfLines;
    self.label.text = text;
    return [self.label sizeThatFits:size];
    
}

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
- (CGSize)textViewSizeThatFits:(CGSize)size font:(UIFont *)font text:(NSString *)text numberOfLines:(int)numberOfLines textContainerInset:(UIEdgeInsets)inset lineFragmentPadding:(CGFloat)lineFragmentPadding lineBreakMode:(NSLineBreakMode)linebreakMode {
    
    self.textView.font = font;
    self.textView.textContainer.maximumNumberOfLines = numberOfLines;
    self.textView.text = text;
    self.textView.textContainerInset = inset;
    self.textView.textContainer.lineFragmentPadding = lineFragmentPadding;
    self.textView.textContainer.lineBreakMode = linebreakMode;
    return [self.textView sizeThatFits:size];
    
}

/**
添加圆角

@param view 添加圆角的视图
@param rect 大小
@param corners 哪些角
@param cornerRadius 圆角大小
*/
- (void)addCornerOnView:(UIView *)view rect:(CGRect)rect roundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path =  [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    view.layer.mask = shapeLayer;
}

/**
 绘制虚线

 @param lineView 绘制视图
 @param lineViewSize 视图的宽高
 @param lineLength 虚线宽
 @param lineSpacing 虚线间距
 @param lineColor 虚线颜色
 */
- (void)drawDashLine:(UIView *)lineView lineViewSize:(CGSize)lineViewSize lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:CGRectMake(0, 0, lineViewSize.width, lineViewSize.height)];
    [shapeLayer setPosition:CGPointMake(lineViewSize.width / 2, lineViewSize.height / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:MIN(lineViewSize.height, lineViewSize.width)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    if (lineViewSize.width > lineViewSize.height) {
        CGPathAddLineToPoint(path, NULL, lineViewSize.width, 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, lineViewSize.height);
    }
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


- (CGSize)getAttributedStringHeight:(NSString*)strDes andSpaceWidth:(CGFloat)fWidth andFont:(UIFont*)font{
    
    CGSize lblSize = [strDes boundingRectWithSize:CGSizeMake(fWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return lblSize;
}

@end
