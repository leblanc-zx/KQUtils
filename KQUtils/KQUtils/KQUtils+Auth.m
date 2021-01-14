//
//  KQUtils+Auth.m
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/8/29.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils+Auth.h"


@implementation KQUtils (Auth)

- (BOOL)isHaveAuth:(nullable NSArray<NSString*> *)authList auth:(KQUtilsAuth)auth {
    
    NSString *authString = @"";
    
    switch (auth) {
        case KQUtilsAuthHOME:
            //首页
            authString = @"HOME";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthFEATURES:
            //服务
            authString = @"FEATURES";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthCOMMUNICATION:
            //通讯
            authString = @"COMMUNICATION";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthORDER_VERIFICATION:
            //核销
            authString = @"ORDER_VERIFICATION";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthORDER:
            //订单
            authString = @"ORDER";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthCOMMISSION:
            //佣金
            authString = @"COMMISSION";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU_HOUSE:
            //我的房源
            authString = @"ZUSHOU_HOUSE";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU_CUSTOMER:
            //我的客源
            authString = @"ZUSHOU_CUSTOMER";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU_DEAL:
            //成交管理
            authString = @"ZUSHOU_DEAL";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU_SURVEY:
            //实勘管理
            authString = @"ZUSHOU_SURVEY";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU_KEY:
            //钥匙管理
            authString = @"ZUSHOU_KEY";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthCONTACTS:
            //通讯录
            authString = @"CONTACTS";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthSPECIAL_FOLLOW:
            //关注
            authString = @"SPECIAL_FOLLOW";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthNOTICE:
            //通知服务
            authString = @"NOTICE";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthTODO:
            //我的待办
            authString = @"TODO";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthCUSTOMER_SERVICE:
            //客服
            authString = @"CUSTOMER_SERVICE";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthYOUXUAN:
            //优选
            authString = @"YOUYUAN";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthZUSHOU:
            //租售
            authString = @"ZUSHOU";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthBUSINESS_GUIDE:
            //办事指南
            authString = @"BUSINESS_GUIDE";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthPAY:
            //缴费
            authString = @"PAY";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthREPORT:
            //报事
            authString = @"REPORT";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthREPAIR:
            //报修
            authString = @"REPAIR";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthCOMPLAIN:
            //投诉
            authString = @"COMPLAIN";
            return [authList containsObject:authString];
            break;
        case KQUtilsAuthQUESTIONNAIRE:
            //问卷
            authString = @"QUESTIONNAIRE";
            return [authList containsObject:authString];
            break;
            
        default:
            return NO;
            break;
    }
    
}

@end
