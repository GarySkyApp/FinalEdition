//
//  PostModel.h
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface PostModel : NSObject

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSString  *base;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger totalElement;
@end
