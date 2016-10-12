//
//  JTableViewDelegate.m
//  ComidityView
//
//  Created by Gary on 16/7/26.
//  Copyright © 2016年 jy. All rights reserved.
//

#import "JTableViewDelegate.h"

@interface JTableViewDelegate ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation JTableViewDelegate


- (void)settingActions:(__weak UITableView *)tableView
            andSession:(sessionBlcok)nsession
               andItem:(itemBlock)nitems
               andCell:(cellBlcok)cell
           andSelected:(selectedBlcok)selected
             andHeight:(heightBlcok)nheight
{
    tableView.delegate = self;
    tableView.dataSource = self;
    _sessions = nsession;
    _items = nitems;
    _cell = cell;
    _selecteds = selected;
    _heights = nheight;
}


#pragma mark - UITableView Delegate / dataSouce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sessions(tableView);
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger titems = _items(tableView, section);
    return titems;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cell(tableView, indexPath);
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selecteds(tableView, indexPath);
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _heights(tableView, indexPath);
}

@end
