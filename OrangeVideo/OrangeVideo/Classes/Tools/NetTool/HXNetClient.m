//
//  HXNetClient.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "HXNetClient.h"
#import "BaseModel.h"

static HXNetClient *netClient = nil;

@implementation HXNetClient

+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netClient = [[HXNetClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    });
    
    return netClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        self.securityPolicy.allowInvalidCertificates = YES;
    }
    
    return self;
}

- (void)requestDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters method:(NetRequestMethod)method block:(responseBlock)block {
    switch (method) {
        case Post: {
            [self POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", task.response.URL.absoluteString);
                BaseModel *baseModel = [BaseModel handleResponseData:responseObject];
                block(baseModel, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(nil, error);
            }];
        }
            break;
        case Get: {
            [self GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", task.response.URL.absoluteString);
                BaseModel *baseModel = [BaseModel handleResponseData:responseObject];
                block(baseModel, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(nil, error);
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
