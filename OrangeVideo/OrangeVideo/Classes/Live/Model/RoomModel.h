//
//  RoomModel.h
//  OrangeVideo
//
//  Created by xing on 2017/7/22.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseModel.h"

@interface RoomModel : BaseModel

@end

@interface RoomBaseModel : BaseModel

@property (nonatomic, copy) NSString *audioUrl;
@property (nonatomic, copy) NSString *rUrl;

@end

@interface RoomStatusModel : BaseModel

@property (nonatomic, strong) RoomBaseModel *message;

@end

@interface RoomUrlModel : BaseModel

@property (nonatomic, copy) NSString *streamType;
@property (nonatomic, copy) NSString *url;

@end
