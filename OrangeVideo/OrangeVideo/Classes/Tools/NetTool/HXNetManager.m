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

- (void)requestGames:(responseBlock)block {
    [[HXNetClient shareInstance] requestDataWithPath:kGamesApi parameters:nil method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

- (void)requestHomeAttentionData:(int)random games:(NSString *)games timestamp:(NSString *)timestamp page:(int)p limit:(int)limit block:(responseBlock)block {
    NSDictionary *dic = @{@"random" : [NSString stringWithFormat:@"%d", random],
                          @"games" : games,
                          @"timestamp" : timestamp,
                          @"p" : [NSString stringWithFormat:@"%d", p],
                          @"limit" : [NSString stringWithFormat:@"%d", limit]};
    
    
    [[HXNetClient shareInstance] requestDataWithPath:kHomeAttentionApi parameters:dic method:Get block:^(id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}

@end
