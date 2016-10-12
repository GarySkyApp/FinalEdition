//
//  ControllerManager.h
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

typedef NS_ENUM(NSInteger, RushType) {
    RushTypeNew,
    RushTypeMore
};
typedef NS_ENUM(NSInteger, MJControlType) {
    MJControllerTypeTableView,
    MJControllerTypeCollectionView
};
typedef void(^rushDataBlcok)(id data, RushType rushType);

@interface ControllerManager : NSObject

-(void) configerRushSetting:(id) listView
             andControlType:(MJControlType)controlType
                        andData:(rushDataBlcok) rushData
                   analysis:(DataManagerType)analysisType
                    andPath:(NSString *)path
                   andParam:(NSDictionary *)param;

-(void)rushNew;
-(void)rushMore;
@end
