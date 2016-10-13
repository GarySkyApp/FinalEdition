//
//  BTableView.m
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//


#import "BTableView.h"
#import "MJRefreshAutoNormalFooter.h"
#import "MJRefreshNormalHeader.h"

@interface BTableView ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, copy) sectionNum sectionsBlock;
@property (nonatomic, copy) itemsOfSection itemOfSectionBlock;
@property (nonatomic, copy) cellOfIndexPath cellBlock;

@end
@implementation BTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(void)configBlock:(sectionNum)section
    itemsOfSection:(itemsOfSection)items
              cell:(cellOfIndexPath)cells{
    _sectionsBlock = section;
    _itemOfSectionBlock = items;
    _cellBlock = cells;
}
-(void)configMjRefreshHeader:(headerBlcok)mjheader andFooter:(footerBlcok)mjfooter{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        mjheader();
    }];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        mjfooter();
    }];
    self.mj_header = header;
    self.mj_footer = footer;
}


#pragma mark - tableView DataSource
-(NSInteger) numberOfSections{
    return _sectionsBlock();
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemOfSectionBlock(tableView, section);
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BTableViewCell *cell = _cellBlock(tableView, indexPath);
    return cell;
}

#pragma mark - interface
-(void)noMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}
-(void)resetNoMoreData{
    [self.mj_footer resetNoMoreData];
}
-(void)stopHeaderRefresh{
    [self.mj_header endRefreshing];
}
-(void)stopFooterRefresh{
    [self.mj_footer endRefreshing];
}
@end
