//
//  BPageController.h
//  Del
//
//  Created by hehai on 16/10/13.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostModel.h"

@protocol BPageControllerDelegate <NSObject>

-(void) pageNewData:(PostModel *)model;
-(void) pageMoreData:(PostModel *)model;
-(void) pageError;
@end

@interface BPageController : NSObject

@property (nonatomic, weak) id<BPageControllerDelegate> delegate;
-(void) pageNew;
-(void) pageMore;

//重载
-(NSString *)getPath;
-(NSDictionary *)getParam:(NSInteger )page andBase:(NSString *)base;
@end
