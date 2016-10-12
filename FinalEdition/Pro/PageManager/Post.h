//
//  Post.h
//  CosmoLove
//
//  Created by Gary on 16/7/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "XCHudHelper.h"
#import "PostModel.h"

#define SPOST [Post sharePost]

@interface Post : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *session;

+(Post *) sharePost;
+(void) setCookie:(NSString *)cookie;
+(void) setTimeoutInterval:(NSTimeInterval) interval;
-(void) postByPath:(NSString *)path
             Param:(NSDictionary *)param
          andBlock:(void(^)(PostModel *model))success
   andResautlError:(void(^)(PostModel *model))resautlError
             error:(void(^)(id errorInfo)) faile;
@end
