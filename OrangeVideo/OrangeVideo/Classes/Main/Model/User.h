//
//  User.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"
#import "Status.h"
#import "Action.h"

@class UserMoreInfo;
@class UserAuth;

@interface User : BaseModel

@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *pwd;

@property (strong, nonatomic) NSString  *nickname;   //昵称
@property (copy  , nonatomic) NSString  *pinyinName;
@property (strong, nonatomic) NSString  *avatar;     //头像
@property (strong, nonatomic) NSString  *background; //头像背景

@property (strong, nonatomic) Status *statis;

@property (strong, nonatomic) NSString *gender;     //性别 男&女
@property (strong, nonatomic) NSString *address;    //所在地,
@property (strong, nonatomic) NSString *stars;      //星座,
@property (strong, nonatomic) NSString *age;        //年龄,
@property (strong, nonatomic) NSString *interest;   //兴趣爱好,
@property (strong, nonatomic) NSString *desc;       //个人简介
@property (strong, nonatomic) NSString *reg_time;   //注册时间戳
@property (strong, nonatomic) NSArray  *game;       //擅长的游戏
@property (strong, nonatomic) NSString *create_time;
@property (strong, nonatomic) NSString *voice;
@property (copy,   nonatomic) NSString *email;      //邮箱
@property (copy,   nonatomic) NSString *email_verify;//邮箱验证状态
@property (copy,   nonatomic) NSString *pay_password_setted;//支付密码设置

@property (strong, nonatomic) UserAuth *auth;    // 认证
@property (strong, nonatomic) Action   *action;

@property (assign, nonatomic) int level;
@property (assign, nonatomic) float exp_rate;

@property (strong, nonatomic) UserMoreInfo *more;
@property (assign, nonatomic) int myVideos;

@property (assign, nonatomic) int is_zan;
@property (assign, nonatomic) int is_follow;
@property (assign, nonatomic) int is_scribe;
@property (assign, nonatomic) int follows;

@property (assign, nonatomic) int money;

@end

@interface UserMoreInfo : BaseModel

@property (strong, nonatomic) NSArray *scribe_game;


@end
@interface UserAuth : BaseModel

@property (nonatomic, strong) NSString *name; // 认证名称
@property (nonatomic, strong) NSString *pic;  // 认证图标
@property (nonatomic, copy)   NSString *_id;
@property (nonatomic, assign) NSInteger           id;

@end
