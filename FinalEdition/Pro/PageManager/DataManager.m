
//
//  DataManager.m
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import "DataManager.h"
#import "PostModel.h"

@implementation DataManager

+(id) dataFromJson:(id)json byType:(DataManagerType)dataType{
    PostModel *model = [PostModel mj_objectWithKeyValues:json];
    switch (dataType) {
        case DataManagerDataList:
            return model.dataList;
            break;
        case DataManagerData:
            return model.data;
            break;
        default:
            break;
    }
}

@end
