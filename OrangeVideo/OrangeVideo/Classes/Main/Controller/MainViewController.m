//
//  MainViewController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "MainViewController.h"
#import "TestViewController.h"
#import "GameModel.h"
#import "FileManager.h"
#import "Video.h"

@interface MainViewController ()

@property (nonatomic, strong) NSMutableArray *dataLists;
@property (nonatomic, strong) VideoList *videoList;

@end

@implementation MainViewController

- (NSMutableArray *)dataLists {
    if (_dataLists == nil) {
        _dataLists = [NSMutableArray array];
    }
    
    return _dataLists;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestGames];
}

- (void)requestGames {
    GameModels *games = [[FileManager shareInstance] getGames];
    
    if (games == nil) {
        __weak typeof(self) weakSelf = self;
        [[HXNetManager shareInstance] requestGames:^(id responseObject, NSError *error) {
            if (error == nil) {
                BaseModel *baseModel = (BaseModel *)responseObject;
                GameModels *games = (GameModels *)[GameModels mj_objectWithKeyValues:baseModel];
                [[FileManager shareInstance] setGames:games];
                [weakSelf loadData:NO];
            } else {
                NSLog(@"%@", error);
            }
        }];
    } else {
        [self loadData:NO];
    }
}

- (void)loadData:(BOOL)isLoadMore {
    GameModels *gamesModles = [[FileManager shareInstance] getGames];
    NSArray *games = gamesModles.games;
    NSMutableString *strGames = [NSMutableString stringWithCapacity:1];
    
    for (GameModel *game in games) {
        [strGames appendFormat:@"%d,", [game.Id intValue]];
    }

    [[HXNetManager shareInstance] requestHomeAttentionData:1 games:strGames timestamp:@"0" page:1 limit:10 block:^(id responseObject, NSError *error) {
        if (error == nil) {
            BaseModel *baseModel = (BaseModel *)responseObject;
            _videoList = [VideoList mj_objectWithKeyValues:baseModel.data];
            
            NSMutableArray *array = [NSMutableArray arrayWithArray:_videoList.lists];
            
            for (VideoDetail *videoDetail in array) {
                if (![videoDetail.type isEqualToString:@"video"]) {
                    [array removeObject:videoDetail];
                }
            }
            
            self.dataLists = array;
            
            NSLog(@"%@", responseObject);
        } else {
            NSLog(@"%@", error);
        }
    }];
}


@end
