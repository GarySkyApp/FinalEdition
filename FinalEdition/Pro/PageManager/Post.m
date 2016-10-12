
//
//  Post.m
//  CosmoLove
//
//  Created by Gary on 16/7/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "Post.h"
#import "MJExtension.h"

#define BasePath @"http://101.201.171.131:8080/"

@interface Post ()

@end

@implementation Post

+(Post *)sharePost{
    static __strong Post *_shareObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareObj = [[Post alloc] init];
        _shareObj.session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BasePath]];
        _shareObj.session.requestSerializer.timeoutInterval = 10;
    });
    return _shareObj;
}
+(void) setCookie:(NSString *)cookie{
    [SPOST.session.requestSerializer setValue:cookie forHTTPHeaderField:@"Cookie"];
}
+(void) setTimeoutInterval:(NSTimeInterval) interval{
    SPOST.session.requestSerializer.timeoutInterval = interval;
}
-(void) postByPath:(NSString *)path
             Param:(NSDictionary *)param
          andBlock:(void(^)(PostModel *model))success
   andResautlError:(void(^)(PostModel *model))resautlError
             error:(void(^)(id errorInfo)) faile
{
    [_session POST:path
        parameters:param
           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
               PostModel *postModel = [PostModel mj_objectWithKeyValues:responseObject];
               if (postModel.status != 0) {
                   resautlError(postModel);
               }else{
                   success(postModel);
               }
               
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               [XCHudHelper showMessage:@"请检查网络~~"];
               faile(error);
           }];
}

@end
