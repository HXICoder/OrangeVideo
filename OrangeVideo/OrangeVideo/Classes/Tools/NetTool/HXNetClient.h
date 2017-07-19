//
//  HXNetClient.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "NetCommon.h"

typedef void(^responseBlock)(id responseObject, NSError *error);

typedef NS_ENUM(NSInteger, NetRequestMethod) {
    Get = 0,
    Post
};

@interface HXNetClient : AFHTTPSessionManager

+ (instancetype)shareInstance;

- (void)requestDataWithPath:(NSString *)path
                 parameters:(NSDictionary *)parameters
                     method:(NetRequestMethod)method
                      block:(responseBlock)block;

@end
