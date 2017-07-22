//
//  RoomViewController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/22.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "RoomViewController.h"
#import "AnchorModel.h"
#import "RoomModel.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface RoomViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) IJKFFMoviePlayerController *ijkPlayer;

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubViews];
    
    [self loadRoomData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_ijkPlayer shutdown];
}

- (void)setupSubViews {
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.closeBtn];
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.view.frame;
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:effect];
        view.frame = self.imageView.frame;
        [self.imageView addSubview:view];
    }
    
    return _imageView;
}

- (UIButton *)closeBtn {
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"menu_btn_close"] forState:UIControlStateNormal];
        [_closeBtn sizeToFit];
        CGFloat w = _closeBtn.bounds.size.width;
        CGFloat h = _closeBtn.bounds.size.height;
        _closeBtn.frame = CGRectMake(self.view.frame.size.width - 10 - w, 30, w, h);
        
        [_closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _closeBtn;
}

- (void)close {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadRoomData {
    __weak typeof(self) weakSelf = self;
    [[HXNetManager shareInstance] requestRoomData:_anchor.roomid userId:_anchor.uid imei:kImei signature:kSignature block:^(id responseObject, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (error == nil) {
            BaseModel *baseModel = (BaseModel *)responseObject;
            RoomStatusModel *model = [RoomStatusModel mj_objectWithKeyValues:baseModel.data];
            
            [strongSelf loadLiveAddress: model.message.rUrl];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (void)loadLiveAddress:(NSString *)rUrl {
    __weak typeof(self) weakSelf = self;
    [[HXNetManager shareInstance] requestLiveUrlData:rUrl block:^(id responseObject, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (error == nil) {
            BaseModel *baseModel = (BaseModel *)responseObject;
            RoomUrlModel *model = [RoomUrlModel mj_objectWithKeyValues:baseModel.data];
            [strongSelf playWithUrl:model.url];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (void)playWithUrl:(NSString *)urlStr {
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setOptionValue:@"1" forKey:@"videotoolbox" ofCategory:kIJKFFOptionCategoryPlayer];
    
    _ijkPlayer = [[IJKFFMoviePlayerController alloc] initWithContentURLString:urlStr withOptions:options];
    
    if (_anchor.push == 1) { // 小视图播放
        CGFloat w = self.imageView.frame.size.width;
        CGFloat h = w * 3 / 4;
        _ijkPlayer.view.frame = CGRectMake(0, 0, w, h);
        _ijkPlayer.view.center = self.imageView.center;
    } else {
        _ijkPlayer.view.frame = self.imageView.frame;
    }

    [self.imageView addSubview:_ijkPlayer.view];
    
    [_ijkPlayer prepareToPlay];
}

@end
