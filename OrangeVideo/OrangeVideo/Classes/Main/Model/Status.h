//
//  Status.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@interface Status : BaseModel

@property (nonatomic, strong) NSString *follows;     //关注
@property (nonatomic, strong) NSString *fans;        //粉丝
@property (nonatomic, strong) NSString *scribe;      //订阅游戏
@property (nonatomic, strong) NSString *zans;        //赞数
@property (nonatomic, strong) NSString *trends;      //动态

@property (nonatomic, strong) NSString *zan;
@property (nonatomic, strong) NSString *play;
@property (nonatomic, strong) NSString *favour;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *share;

@property (nonatomic, assign) NSInteger comment;     //just for news

@end
