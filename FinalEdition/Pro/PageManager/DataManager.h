//
//  DataManager.h
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DataManagerType) {
    DataManagerData,
    DataManagerDataList
};

@interface DataManager : NSObject

+(id) dataFromJson:(id)json byType:(DataManagerType)dataType;
@end
