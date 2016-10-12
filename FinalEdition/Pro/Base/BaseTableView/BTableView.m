//
//  BTableView.m
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//


#import "BTableView.h"

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

@end
