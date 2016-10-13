//
//  Post.h
//  CosmoLove
//
//  Created by Gary on 16/7/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostModel.h"

#define SPOST [Post sharePost]

@interface Post : NSObject

+(id) sharePost;
-(void) postByPath:(NSString *)path
             Param:(NSDictionary *)param
          andBlock:(void(^)(PostModel *model))success
         postFaile:(void(^)())postFaile
             error:(void(^)(id error)) postError;
@end
