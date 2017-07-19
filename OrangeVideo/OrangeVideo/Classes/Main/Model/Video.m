//
//  Video.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "Video.h"

@implementation Video

@end

@implementation VideoData

@end

@implementation VideoDetail
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"videoData" : @"data"};
}
@end

@implementation VideoList

+ (NSDictionary *)objectClassInArray {
    return @{@"lists" : @"VideoDetail"};
}

@end
