//
//  WaterFallLayout.h
//  OrangeVideo
//
//  Created by xing on 2017/7/21.
//  Copyright © 2017年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFallLayout;

extern CGFloat edgeInsetMarge;

@protocol WaterFallLayoutDataSource <NSObject>

- (NSInteger)numberOfColumns;

- (CGFloat)cellHeight:(WaterFallLayout *)waterFallLayout indexPath:(NSIndexPath *)indexPath;

@end

@interface WaterFallLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id <WaterFallLayoutDataSource> dataSource;

@end
