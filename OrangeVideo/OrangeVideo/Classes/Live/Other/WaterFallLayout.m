//
//  WaterFallLayout.m
//  OrangeVideo
//
//  Created by xing on 2017/7/21.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "WaterFallLayout.h"

CGFloat edgeInsetMarge = 8;

@interface WaterFallLayout ()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *attributes;
@property (nonatomic, strong) NSMutableArray *cellHeights;
@property (nonatomic, assign) CGFloat maxHeight;
@property (nonatomic, assign) NSInteger startPosition;
@property (nonatomic, assign) NSInteger columns;

@end

@implementation WaterFallLayout

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)attributes {
    if (_attributes == nil) {
        _attributes = [NSMutableArray array];
    }
    
    return _attributes;
}

- (NSMutableArray *)cellHeights {
    if (_cellHeights == nil) {
        CGFloat height = self.sectionInset.top;

        _cellHeights = [NSMutableArray array];
        for (int i = 0; i < self.columns; i++) {
            [_cellHeights addObject:@(height)];
        }
    }
    
    return _cellHeights;
}

- (NSInteger)columns {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfColumns)]) {
        _columns = [self.dataSource numberOfColumns];
    } else {
        _columns = 2;
    }
    
    return _columns;
}

- (instancetype)init {
    if (self = [super init]) {
        self.startPosition = 0;
    }
    
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat width = (self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right - (self.columns - 1) * self.minimumInteritemSpacing) * 1.0 / self.columns;
    
    for (NSInteger i = self.startPosition; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        CGFloat height = 0;
        
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(cellHeight:indexPath:)]) {
            height = [self.dataSource cellHeight:self indexPath:indexPath];
        }
        
        NSNumber *minHeight = [[self.cellHeights sortedArrayUsingSelector:@selector(compare:)] firstObject];
        NSInteger index = [self.cellHeights indexOfObject:minHeight];
        CGFloat tempHeight = [minHeight floatValue] + self.minimumLineSpacing + height;
        self.cellHeights[index] = [NSNumber numberWithFloat:tempHeight];
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        CGFloat x = self.sectionInset.left + (width + self.minimumInteritemSpacing) * index;
        attributes.frame = CGRectMake(x, [self.cellHeights[index] floatValue] - height - self.minimumLineSpacing, width, height);
        
        [self.attributes addObject:attributes];
    }
    
    self.maxHeight = [[[self.cellHeights sortedArrayUsingSelector:@selector(compare:)] lastObject] floatValue];
    self.startPosition = count;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributes;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, self.maxHeight - self.minimumLineSpacing + self.sectionInset.bottom);
}

@end
