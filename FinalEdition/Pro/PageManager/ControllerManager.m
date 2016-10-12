//
//  ControllerManager.m
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import "ControllerManager.h"
#import "PageManager.h"
#import "Post.h"
//依赖
#import "AFNetworking.h"
#import "XCHudHelper.h"
#import "MJRefresh.h"

@interface ControllerManager ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, copy) rushDataBlcok dataBlock;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, strong) NSString *base;
@property (nonatomic, assign) DataManagerType anType;
//post
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSMutableDictionary *param;
@end

@implementation ControllerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pageIndex = 1;
        _base = @"0";
    }
    return self;
}

-(void) configerRushSetting:(id) listView
             andControlType:(MJControlType)controlType
                        andData:(rushDataBlcok) rushData
                   analysis:(DataManagerType)analysisType
                    andPath:(NSString *)path
                   andParam:(NSDictionary *)param
{
    self.path = path;
    self.param = param.mutableCopy;
    _dataBlock = rushData;
    _anType = analysisType;
    switch (controlType) {
        case MJControllerTypeTableView:
            self.tableView = listView;
            break;
        case MJControllerTypeCollectionView:
            self.collectionView = listView;
            break;
        default:
            break;
    }
    [self configerMJ];
}

#pragma mark- MJ交互
-(void)rushNew{
    if (_tableView) {
        [_tableView.mj_header beginRefreshing];
    }
    if (_collectionView) {
        [_collectionView.mj_header beginRefreshing];
    }
}
-(void)rushMore{
    if (_tableView) {
        [_tableView.mj_footer beginRefreshing];
    }
    if (_collectionView) {
        [_collectionView.mj_footer beginRefreshing];
    }
}
-(void)endHearder{
    if (_tableView) {
        [_tableView.mj_header endRefreshing];
    }
    if (_collectionView) {
        [_collectionView.mj_header endRefreshing];
    }
}
-(void)endFooter{
    if (_tableView) {
        [_tableView.mj_footer endRefreshing];
    }
    if (_collectionView) {
        [_collectionView.mj_footer endRefreshing];
    }
}
-(void)nomoreData{
    if (_tableView) {
        [_tableView.mj_footer endRefreshingWithNoMoreData];
    }
    if (_collectionView) {
        [_collectionView.mj_footer endRefreshingWithNoMoreData];
    }
}
-(void)moreData{
    if (_tableView) {
        [_tableView.mj_footer resetNoMoreData];
    }
    if (_collectionView) {
        [_collectionView.mj_footer resetNoMoreData];
    }
}

-(void)configerMJ{
    MJRefreshNormalHeader *mjheader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self clearParam];
        [self post:_path
          andParam:_param
           andType:RushTypeNew
          analysis:_anType];
    }];
    MJRefreshAutoNormalFooter *mjfooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self upPageParam];
        [self post:_path
          andParam:_param
           andType:RushTypeMore
          analysis:_anType];
    }];
    if (_tableView) {
        _tableView.mj_header = mjheader;
        _tableView.mj_footer = mjfooter;
    }
    if (_collectionView) {
        _collectionView.mj_header = mjheader;
        _collectionView.mj_footer = mjfooter;
    }
}

#pragma mark- Interface
-(void)postNew{
    [self rushNew];
}
-(void)postMore{
    [self rushMore];
}

#pragma mark- 网络请求
-(void)clearParam{
    _pageIndex = 1;
    _base = @"0";
    [_param setObject:@1 forKey:@"page"];
    [_param setObject:@"0" forKey:@"base"];
}
-(void)upPageParam{
    [_param setObject:@(_pageIndex) forKey:@"page"];
    [_param setObject:CheackNilWithDefault(_base, @"0") forKey:@"base"];
}
-(void)post:(NSString *)path
   andParam:(NSDictionary *)param
    andType:(RushType) rushType
   analysis:(DataManagerType)analysisType
{
    [SPOST postByPath:path
                Param:param
             andBlock:^(PostModel *model) {
                 [self rushTypeCheack:model andType:rushType analysis:analysisType];
             }andResautlError:^(PostModel *model) {
                 [XCHudHelper showMessage:model.message];
                 [self endRush:rushType];
             }error:^(id errorInfo) {
                 [XCHudHelper showMessage:@"请检查网络"];
                 [self endRush:rushType];
             }];
}
-(void)endRush:(RushType )type{
    switch (type) {
        case RushTypeNew:
            [self endHearder];
            break;
        case RushTypeMore:
            [self endFooter];
            break;
        default:
            break;
    }
}
-(void)rushTypeCheack:(PostModel *)model
              andType:(RushType)type
             analysis:(DataManagerType)analysisType
{
    //
    [self endRush:type];
    _dataBlock([DataManager dataFromJson:model byType:analysisType], type);
    PageManagerType pageType = [PageManager page:_pageIndex
                                    andTotalPage:model.totalPage];
    switch (pageType) {
        case PageManagerMore:
            [self moreData];
            break;
        case PageManagerNoMore:
            [self nomoreData];
            break;
        default:
            break;
    }
    //更新page
    if (_pageIndex>model.totalPage) {
        _pageIndex = model.totalPage;
    }else{
        _pageIndex++;
    }
    //更新base
    _base = model.base;
}
@end
