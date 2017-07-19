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

- (void)requestGames:(responseBlock)block;

- (void)requestHomeAttentionData:(int)random
                           games:(NSString *)games
                       timestamp:(NSString *)timestamp
                            page:(int)p
                           limit:(int)limit
                           block:(responseBlock)block;

@end
