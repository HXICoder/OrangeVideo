//
//  HomeVideoCell.m
//  OrangeVideo
//
//  Created by xing on 2017/7/20.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "HomeVideoCell.h"
#import <UIImageView+WebCache.h>

NSString *homeVideoCellId = @"homeVideoCellId";

#define edgeSpace 15

#define width        ([UIScreen mainScreen].bounds.size.width - 2 * edgeSpace)
#define cellheight   (width * 9.0 / 16 + edgeSpace)

@interface HomeVideoCell ()

@property (nonatomic, strong) UIImageView *coverImgView;

@end

@implementation HomeVideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews {
    self.coverImgView = [[UIImageView alloc] init];
    self.coverImgView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:_coverImgView];
}

- (void)setModel:(Video *)model {
    _model = model;
    
    [_coverImgView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
}

+ (CGFloat)height {
    return cellheight;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverImgView.frame = CGRectMake(edgeSpace, edgeSpace, width, cellheight - edgeSpace);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
