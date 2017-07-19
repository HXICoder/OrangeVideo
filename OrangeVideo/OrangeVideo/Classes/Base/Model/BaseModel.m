//
//  BaseModel.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (instancetype)handleResponseData:(id)data {
    BaseModel *baseModel = [[BaseModel alloc] init];

    if ([data isKindOfClass:[NSDictionary class]]) {
        baseModel.code = [[data objectForKey:@"code"] integerValue];
        baseModel.info = [data objectForKey:@"info"];
        baseModel.data = [data objectForKey:@"data"];
        
    } else if ([data isKindOfClass:[NSArray class]]) {
        baseModel.code = Success;
        baseModel.data = data;
    }
    
    return baseModel;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self mj_decode:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self mj_encode:aCoder];
}

- (id)copyWithZone:(NSZone *)zone {
    id copyInstance = [[[self class] allocWithZone:zone] init];
    
    size_t size = class_getInstanceSize([self class]);
    
    memcpy((__bridge void *)(copyInstance), (__bridge const void *)(self), size);
    
    return copyInstance;
}

@end
