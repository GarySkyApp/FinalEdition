
//
//  Post.m
//  CosmoLove
//
//  Created by Gary on 16/7/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "Post.h"
#import "AFNetworking.h"
#import "XCHudHelper.h"
#import "MJExtension.h"

@interface Post ()

@property (nonatomic, strong) AFHTTPSessionManager *session;
@end

@implementation Post

+(id)sharePost{
    static __strong Post *_shareObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareObj = [[Post alloc] init];
        _shareObj.session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
    });
    return _shareObj;
}


-(void) postByPath:(NSString *)path
             Param:(NSDictionary *)param
          andBlock:(void(^)(PostModel *model))success
         postFaile:(void (^)())postFaile
             error:(void (^)(id))postError
{
    //传入Cookie
//    NSString *userUUID = [UserInfoManager shareUserManager].userInfo.UUID;
//    NSString *cookie = [NSString stringWithFormat:@"uuid=%@",userUUID ];
//    [_session.requestSerializer setValue:cookie forHTTPHeaderField:@"Cookie"];
    
    [_session POST:path
        parameters:param
           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
               PostModel *postModel = [PostModel mj_objectWithKeyValues:responseObject];
               if (postModel.status != 0) {
                   postFaile();
                   [XCHudHelper showMessage:postModel.message];
               }else{
                   success(postModel);
               }
               
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               [XCHudHelper showMessage:@"请检查网络~~"];
               postError(error);
           }];
}

@end
