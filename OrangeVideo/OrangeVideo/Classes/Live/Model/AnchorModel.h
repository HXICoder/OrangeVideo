//
//  AnchorModel.h
//  OrangeVideo
//
//  Created by xing on 2017/7/21.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@interface AnchorModel : BaseModel

@property (nonatomic, assign) int roomid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pic51;
@property (nonatomic, copy) NSString *pic74;
@property (nonatomic, assign) int live;     // 是否在直播
@property (nonatomic, assign) int push;     // 直播显示方式
@property (nonatomic, assign) int focus;    // 关注数
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, assign) BOOL isEvenIndex;

@end

@class AnchorsModel;

@interface AnchorMessageModel : BaseModel

@property (nonatomic, strong) AnchorsModel *message;

@end

@interface AnchorsModel : BaseModel

@property (nonatomic, strong) NSArray *anchors;

@end
