//
//  HXNetManager.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "HXNetManager.h"

static HXNetManager *netManager = nil;

@implementation HXNetManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[HXNetManager alloc] init];
    });
    
    return netManager;
}

#pragma mark - 请求游戏类型
- (void)requestGames:(responseBlock)block {
    [[HXNetClient shareInstance] requestDataWithPath:kGamesApi parameters:nil method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

#pragma mark - 首页数据
- (void)requestHomeAttentionData:(int)random games:(NSString *)games timestamp:(NSString *)timestamp page:(int)p limit:(int)limit block:(responseBlock)block {
    NSDictionary *dic = @{@"random" : [NSString stringWithFormat:@"%d", random],
                          @"games" : games,
                          @"timestamp" : timestamp,
                          @"p" : [NSString stringWithFormat:@"%d", p],
                          @"limit" : [NSString stringWithFormat:@"%d", limit]
                          };
    
    
    [[HXNetClient shareInstance] requestDataWithPath:kHomeAttentionApi parameters:dic method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

#pragma mark - 主播列表数据请求
- (void)requestAnchorData:(int)type index:(int)index size:(int)size block:(responseBlock)block {
    NSDictionary *dic = @{
                          @"type" : [NSString stringWithFormat:@"%d", type],
                          @"index" : [NSString stringWithFormat:@"%d", index],
                          @"size" : [NSString stringWithFormat:@"%d", size]
                          };
    [[HXNetClient shareInstance] requestDataWithPath:kAnchorApi parameters:dic method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

#pragma mark - 获取房间信息
- (void)requestRoomData:(int)roomId userId:(NSString *)userId imei:(NSString *)imei signature:(NSString *)signature block:(responseBlock)block {
    NSDictionary *dic = @{
                          @"roomId" : [NSString stringWithFormat:@"%d", roomId],
                          @"userId" : userId,
                          @"imei" : imei,
                          @"signature" : signature
                          };
    [[HXNetClient shareInstance] requestDataWithPath:kRoomApi parameters:dic method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

#pragma mark - 获取直播url
- (void)requestLiveUrlData:(NSString *)urlString block:(responseBlock)block {
    [[HXNetClient shareInstance] requestDataWithPath:urlString parameters:nil method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

@end
