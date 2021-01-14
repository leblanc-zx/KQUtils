//
//  KQUtils+HtmlString.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/9/12.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface KQUtils (HtmlString)

//将 &lt 等类似的字符转化为HTML中的“<”等
- (NSString *)htmlEntityDecode:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
