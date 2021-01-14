//
//  KQUtils+Auth.h
//  KangYunGuanJia
//
//  Created by zhouxiang on 2020/8/29.
//  Copyright © 2020 zhoux@zzkqdc.com. All rights reserved.
//

#import "KQUtils.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, KQUtilsAuth) {
    /// 首页
    KQUtilsAuthHOME,
    /// 服务
    KQUtilsAuthFEATURES,
    /// 通讯
    KQUtilsAuthCOMMUNICATION,
    /// 核销
    KQUtilsAuthORDER_VERIFICATION,
    /// 订单
    KQUtilsAuthORDER,
    /// 佣金
    KQUtilsAuthCOMMISSION,
    /// 我的房源
    KQUtilsAuthZUSHOU_HOUSE,
    /// 我的客源
    KQUtilsAuthZUSHOU_CUSTOMER,
    /// 成交管理
    KQUtilsAuthZUSHOU_DEAL,
    /// 实勘管理
    KQUtilsAuthZUSHOU_SURVEY,
    /// 钥匙管理
    KQUtilsAuthZUSHOU_KEY,
    /// 通讯录
    KQUtilsAuthCONTACTS,
    /// 关注
    KQUtilsAuthSPECIAL_FOLLOW,
    /// 通知服务
    KQUtilsAuthNOTICE,
    /// 我的待办
    KQUtilsAuthTODO,
    /// 客服
    KQUtilsAuthCUSTOMER_SERVICE,
    /// 优选
    KQUtilsAuthYOUXUAN,
    /// 租售
    KQUtilsAuthZUSHOU,
    /// 办事指南
    KQUtilsAuthBUSINESS_GUIDE,
    /// 缴费
    KQUtilsAuthPAY,
    /// 报事
    KQUtilsAuthREPORT,
    /// 报修
    KQUtilsAuthREPAIR,
    /// 投诉
    KQUtilsAuthCOMPLAIN,
    /// 问卷
    KQUtilsAuthQUESTIONNAIRE
};

@interface KQUtils (Auth)

- (BOOL)isHaveAuth:(nullable NSArray<NSString*> *)authList auth:(KQUtilsAuth)auth;

@end

NS_ASSUME_NONNULL_END
