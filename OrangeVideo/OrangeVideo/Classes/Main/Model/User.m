//
//  User.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"id" : @"uid"};
}

@end

@implementation UserMoreInfo

@end

@implementation UserAuth

@end
