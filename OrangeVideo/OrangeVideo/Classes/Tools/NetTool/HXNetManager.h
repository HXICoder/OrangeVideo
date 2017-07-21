//
//  HXNetManager.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HXNetClient.h"

@interface HXNetManager : NSObject

+ (instancetype)shareInstance;

/**
 游戏类型请求
 */
- (void)requestGames:(responseBlock)block;

/**
 首页数据请求
 */
- (void)requestHomeAttentionData:(int)random
                           games:(NSString *)games
                       timestamp:(NSString *)timestamp
                            page:(int)p
                           limit:(int)limit
                           block:(responseBlock)block;

/**
 主播数据请求
 */
- (void)requestAnchorData:(int)type
                    index:(int)index
                     size:(int)size
                    block:(responseBlock)block;

@end
