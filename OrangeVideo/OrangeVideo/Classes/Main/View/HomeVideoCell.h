//
//  HomeVideoCell.h
//  OrangeVideo
//
//  Created by xing on 2017/7/20.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

extern NSString *homeVideoCellId;

@interface HomeVideoCell : UITableViewCell

@property (nonatomic, strong) Video *model;

+ (CGFloat)height;

@end
