//
//  Action.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@interface Action : BaseModel

//!@brief 是否已点赞的标识符，0为未点赞，1为已点赞
@property (nonatomic, assign) BOOL is_zan;

//!@brief 是否已收藏的标识符，0为未收藏，1为已收藏
@property (nonatomic, assign) BOOL is_favour;

@property (nonatomic, assign) BOOL is_follow;

@end
