//
//  BaseModel.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

typedef NS_ENUM(NSInteger, NetResponseCode) {
    Success = 200,
    ParametersError = 101, // 参数错误
    UnLoginError = 501,     // 用户未登录
};

@interface BaseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, strong) id data;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

+ (instancetype)handleResponseData:(id)data;

@end
