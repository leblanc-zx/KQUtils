//
//  KQUtils+HtmlString.m
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/9/12.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils+HtmlString.h"

@implementation KQUtils (HtmlString)

//将 &lt 等类似的字符转化为HTML中的“<”等
- (NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
    
    return [self getHtml:string];
}

- (NSString *)getHtml:(NSString *)string {
    
    NSMutableString *htmlString = [[NSMutableString alloc] init];
    [htmlString appendString:@"<html>"];
    [htmlString appendString:@"<head>"];
    [htmlString appendString:@"<meta charset=\"utf-8\">"];
    [htmlString appendString:@"<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no\"/>"];
    
    [htmlString appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">"];
    [htmlString appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [htmlString appendString:@"<meta name = \"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    [htmlString appendString:@"<style>img{width:100%;}</style>"];
    [htmlString appendString:@"<style>img{height:auto;}</style>"];
    
    [htmlString appendString:@"<title>标题</title>"];
    [htmlString appendString:@"</head>"];
    [htmlString appendString:@"<body>"];
    //[htmlString appendString:@"<div>"];
    [htmlString appendString:@"<p>"];
    [htmlString appendString:@"你好啊"];
    [htmlString appendString:@"</p>"];
    [htmlString appendString:string];
    //[htmlString appendString:@"</div>"];
    [htmlString appendString:@"</body>"];
    [htmlString appendString:@"</html>"];
    
    return htmlString;

}

@end
