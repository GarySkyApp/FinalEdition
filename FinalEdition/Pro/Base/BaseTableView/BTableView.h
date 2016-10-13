//
//  BTableView.h
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

/*
 注意，接受的数据结构为：{@“dataList”:...}
 */

#import <UIKit/UIKit.h>
#import "BTableViewCell.h"
#import "PostModel.h"

typedef NSInteger (^sectionNum)();
typedef NSInteger (^itemsOfSection)(UITableView *tableView, NSInteger section);
typedef BTableViewCell * (^cellOfIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

//
typedef void (^headerBlcok)();
typedef void (^footerBlcok)();

@interface BTableView : UITableView

-(void)configBlock:(sectionNum)section
    itemsOfSection:(itemsOfSection)items
              cell:(cellOfIndexPath)cells;
-(void)configMjRefreshHeader:(headerBlcok)mjheader andFooter:(footerBlcok)mjfooter;


-(void) setNewData:(PostModel *)model;
-(void) setMoreData:(PostModel *)model;

-(void)noMoreData;
-(void)resetNoMoreData;
-(void)stopHeaderRefresh;
-(void)stopFooterRefresh;
@end
