//
//  FileManager.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "FileManager.h"

#define kCachePath   [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define kFilePath    [kCachePath stringByAppendingPathComponent:@"file.plist"]

static FileManager *fileManager = nil;

@implementation FileManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fileManager = [[FileManager alloc] init];
        NSMutableDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:kFilePath];
        
        if (dic == nil) {
            dic = [NSMutableDictionary dictionary];
            [NSKeyedArchiver archiveRootObject:dic toFile:kFilePath];
        }
    });
    
    return fileManager;
}

- (void)setGames:(id)games {
    NSMutableDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:kFilePath];
    
    [dic setValue:games forKey:@"games"];
    
    [NSKeyedArchiver archiveRootObject:dic toFile:kFilePath];
}

- (NSArray *)getGames {
    NSMutableDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:kFilePath];
    return dic[@"games"];
}

@end
