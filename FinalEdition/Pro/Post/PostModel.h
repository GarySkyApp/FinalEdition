//
//  PostModel.h
//  CosmoLove
//
//  Created by Gary on 16/7/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString  *message;
@property (nonatomic, strong) NSArray   *dataList;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSString  *base;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger totalElement;
@property (nonatomic, assign) NSInteger nPage;

@end
