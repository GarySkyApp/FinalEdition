//
//  JTableViewDelegate.h
//  ComidityView
//
//  Created by Gary on 16/7/26.
//  Copyright © 2016年 jy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger (^sessionBlcok)(UITableView *tableView);
typedef NSInteger (^itemBlock)(UITableView *tableView, NSInteger session);
typedef UITableViewCell *(^cellBlcok)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^selectedBlcok)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^heightBlcok)(UITableView *tableView, NSIndexPath *indexPath);

@interface JTableViewDelegate : NSObject

@property (nonatomic, copy) sessionBlcok sessions;
@property (nonatomic, copy) itemBlock items;
@property (nonatomic, copy) cellBlcok cell;
@property (nonatomic, copy) selectedBlcok selecteds;
@property (nonatomic, copy) heightBlcok heights;

-(void) settingActions:(UITableView *)tableView
            andSession:(sessionBlcok) nsession
               andItem:(itemBlock)nitems
               andCell:(cellBlcok )cell
           andSelected:(selectedBlcok)selected
             andHeight:(heightBlcok)nheight;

@end
