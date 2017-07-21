//
//  AnchorCell.h
//  OrangeVideo
//
//  Created by xing on 2017/7/21.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnchorModel;

extern NSString *anchorCellId;

@interface AnchorCell : UICollectionViewCell

@property (nonatomic, strong) AnchorModel *model;

@end
