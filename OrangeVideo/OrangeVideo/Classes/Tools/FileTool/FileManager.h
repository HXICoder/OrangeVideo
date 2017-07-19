//
//  FileManager.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

+ (instancetype)shareInstance;

- (void)setGames:(id)games;
- (id)getGames;

@end
