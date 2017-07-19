//
//  GameModel.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"Id" : @"id"};
}

@end

@implementation GameModels

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"games" : @"data"};
}

+ (NSDictionary *)objectClassInArray {
    return @{@"games" : @"GameModel"};
}

@end

@implementation GameDetal

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"Id" : @"id"};
}

@end

