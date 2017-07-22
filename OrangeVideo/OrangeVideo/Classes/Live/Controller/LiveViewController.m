//
//  LiveViewController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/20.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "LiveViewController.h"
#import "WaterFallLayout.h"
#import "AnchorCell.h"
#import "AnchorModel.h"
#import "RoomViewController.h"

@interface LiveViewController () <UICollectionViewDelegate, UICollectionViewDataSource, WaterFallLayoutDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *anchors;

@end

@implementation LiveViewController

- (NSMutableArray *)anchors {
    if (_anchors == nil) {
        _anchors = [NSMutableArray array];
    }
    
    return _anchors;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadData:0];
}

- (void)loadData:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    [[HXNetManager shareInstance] requestAnchorData:0 index:(int)index size:50 block:^(id responseObject, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (error == nil) {
            BaseModel *baseModel = (BaseModel *)responseObject;
            AnchorMessageModel *anchorMsg = [AnchorMessageModel mj_objectWithKeyValues:baseModel.data];
            
            [strongSelf.anchors addObjectsFromArray:anchorMsg.message.anchors];
            
            [strongSelf.collectionView reloadData];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        WaterFallLayout *waterFallLayout = [[WaterFallLayout alloc] init];
        waterFallLayout.sectionInset = UIEdgeInsetsMake(edgeInsetMarge, edgeInsetMarge, edgeInsetMarge, edgeInsetMarge);
        waterFallLayout.minimumLineSpacing = edgeInsetMarge;
        waterFallLayout.minimumInteritemSpacing = edgeInsetMarge;
        waterFallLayout.dataSource = self;
        
        CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:waterFallLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[AnchorCell class] forCellWithReuseIdentifier:anchorCellId];
        
        [self.view addSubview:_collectionView];
        
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate, DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.anchors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AnchorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:anchorCellId forIndexPath:indexPath];
    
    AnchorModel *anchor = self.anchors[indexPath.item];
    anchor.isEvenIndex = indexPath.item % 2 == 0;
    
    cell.model = anchor;
    
    if (indexPath.item == self.anchors.count - 1) {
        [self loadData:self.anchors.count];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    AnchorModel *anchor = self.anchors[indexPath.item];
    
    RoomViewController *roomVC = [[RoomViewController alloc] init];
    roomVC.anchor = anchor;
    roomVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:roomVC animated:YES];
}

#pragma mark - WaterFallLayoutDataSource
- (NSInteger)numberOfColumns {
    return 2;
}

- (CGFloat)cellHeight:(WaterFallLayout *)waterFallLayout indexPath:(NSIndexPath *)indexPath {
    return indexPath.item % 2 == 0 ? kScreenW * 2 / 3 : kScreenW * 0.5;
}

@end
