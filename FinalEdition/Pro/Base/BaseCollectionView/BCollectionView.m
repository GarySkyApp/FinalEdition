
//
//  BCollectionView.m
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

#import "BCollectionView.h"

@interface BCollectionView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
>

@property (nonatomic, copy) sectionNum sectionsBlock;
@property (nonatomic, copy) itemsOfSection itemOfSectionBlock;
@property (nonatomic, copy) cellOfIndexPath cellBlock;

@end

@implementation BCollectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
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


#pragma mark - delegate / datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BCollectionViewCell *cell = _cellBlock(collectionView, indexPath);
    return cell;
}
@end
