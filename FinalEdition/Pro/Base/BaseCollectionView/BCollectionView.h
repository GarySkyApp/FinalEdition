//
//  BCollectionView.h
//  DelTableView
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCollectionViewCell.h"

typedef NSInteger (^sectionNum)();
typedef NSInteger (^itemsOfSection)(UICollectionView *collectionView, NSInteger section);
typedef BCollectionViewCell * (^cellOfIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);

@interface BCollectionView : UICollectionView

@end
