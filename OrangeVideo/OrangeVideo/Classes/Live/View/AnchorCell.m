//
//  AnchorCell.m
//  OrangeVideo
//
//  Created by xing on 2017/7/21.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "AnchorCell.h"
#import "AnchorModel.h"
#import <UIImageView+WebCache.h>

NSString *anchorCellId = @"anchorCellId";

@interface AnchorCell ()

@property (nonatomic, strong) UIImageView *coverImgView;

@end

@implementation AnchorCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
        
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)setupSubViews {
    self.coverImgView = [[UIImageView alloc] init];
    self.coverImgView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.coverImgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.coverImgView];
}

- (void)setModel:(AnchorModel *)model {
    _model = model;
    
    NSString *imgPath = model.isEvenIndex ? model.pic74 : model.pic51;
    
    [_coverImgView sd_setImageWithURL:[NSURL URLWithString:imgPath] placeholderImage:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverImgView.frame = CGRectMake(2, 2, self.contentView.frame.size.width - 4, self.contentView.frame.size.height - 4);
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];

}

@end
