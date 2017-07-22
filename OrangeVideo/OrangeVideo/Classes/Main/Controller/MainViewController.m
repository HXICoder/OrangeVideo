//
//  MainViewController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "MainViewController.h"
#import "GameModel.h"
#import "FileManager.h"
#import "Video.h"
#import "HomeVideoCell.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataLists;
@property (nonatomic, strong) VideoList *videoList;
@property (nonatomic, strong) UITableView *tableView;

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

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestGames];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 49 - 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView registerClass:[HomeVideoCell class] forCellReuseIdentifier:homeVideoCellId];
        [self.view addSubview:_tableView];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _tableView;
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

    __weak typeof(self) weakSelf = self;
    [[HXNetManager shareInstance] requestHomeAttentionData:1 games:strGames timestamp:@"0" page:1 limit:20 block:^(id responseObject, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (error == nil) {
            BaseModel *baseModel = (BaseModel *)responseObject;
            strongSelf.videoList = [VideoList mj_objectWithKeyValues:baseModel.data];
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
            
            for (VideoDetail *videoDetail in strongSelf.videoList.lists) {
                if ([videoDetail.type isEqualToString:@"video"]) {
                    [array addObject:videoDetail];
                }
            }
            
            strongSelf.dataLists = array;
            [strongSelf.tableView reloadData];
            
            NSLog(@"%@", responseObject);
        } else {
            NSLog(@"%@", error);
        }
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%zd", indexPath.row);
    HomeVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:homeVideoCellId];
    
    VideoDetail *videoDetail = self.dataLists[indexPath.row];
    Video *video = videoDetail.videoData.baseinfo;
    
    cell.model = video;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HomeVideoCell height];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
