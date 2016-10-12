//
//  BTableView.h
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTableViewCell.h"

typedef NSInteger (^sectionNum)();
typedef NSInteger (^itemsOfSection)(UITableView *tableView, NSInteger section);
typedef BTableViewCell * (^cellOfIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

@interface BTableView : UITableView

-(void)configBlock:(sectionNum)section
    itemsOfSection:(itemsOfSection)items
              cell:(cellOfIndexPath)cells;
@end
