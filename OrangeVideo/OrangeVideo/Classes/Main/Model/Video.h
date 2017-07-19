//
//  Video.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"
#import "User.h"
#import "Status.h"
#import "Action.h"
#import "GameModel.h"

@interface Video : BaseModel

@property (nonatomic, assign) int id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, retain) NSString *uri;
@property (nonatomic, retain) NSString *pre_uri;

@property (nonatomic, assign) int      type;  //!@brief 视频类型，0:视频，1:比赛
@property (nonatomic, retain) NSString *time; // time值可能为NSNull值，使用时最好先做下NSNull判断
@property (nonatomic, retain) NSString *detail;
@property (nonatomic, assign) int      uid;
@property (nonatomic, retain) User     *user;
@property (nonatomic, retain) Action   *action;
@property (nonatomic, assign) int       game_id;
@property (nonatomic, retain) GameDetal    *game;
@property (nonatomic, retain) Status   *statis;
@property (nonatomic, retain) NSArray *icons;   //标签图标地址数组
@property (nonatomic, retain) NSArray *tags;  // tags在有值时为NSArray，无值时为@""NSString空字符串，这里需要手动判断下
@property (nonatomic, retain) NSString *create_time;
@property (nonatomic, retain) NSString *time_point; // 当前视频所在源视频(总视频)的时间点的字符串值
@property (nonatomic, retain) NSString *update_time;
@property (nonatomic, retain) NSString *watch_time;
@property (nonatomic, copy) NSString *favour_time;

@property (assign, nonatomic) int      group_id;
@property (nonatomic ,retain) NSArray *dpi_levels;

@property (nonatomic, assign) int reward_total;

@property (nonatomic, assign) int dpi_width;
@property (nonatomic, assign) int dpi_height;

@end

@interface VideoData : BaseModel

@property (nonatomic, strong) Video *baseinfo;

@end

@interface VideoDetail : BaseModel

@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) VideoData *videoData;

@end

@interface VideoList : BaseModel

@property (nonatomic, strong) NSArray *lists;

@end
