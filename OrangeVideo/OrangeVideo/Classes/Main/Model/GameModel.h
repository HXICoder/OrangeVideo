//
//  GameModel.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@interface GameModel : BaseModel

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *pic;                     //图片地址
@property (strong, nonatomic) NSString *background;
@property (strong, nonatomic) NSNumber *scribe;        //订阅人数
@property (strong, nonatomic) NSNumber *is_scribe;     //是否订阅

@end

@interface GameModels : BaseModel

@property (nonatomic, strong) NSArray *games;

@end

@interface GameDetal : BaseModel

@property (nonatomic, assign) int Id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *pic;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSString *background;
@property (nonatomic, retain) NSString *cover;
@property (nonatomic, retain) NSString *detail;
@property (nonatomic, retain) NSString *create_time;
@property (nonatomic, retain) NSString *scribe;
@property (nonatomic, retain) NSString *sort;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *update_time;

@end
