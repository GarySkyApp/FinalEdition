
//
//  BPageController.m
//  Del
//
//  Created by hehai on 16/10/13.
//  Copyright © 2016年 J. All rights reserved.
//

#import "BPageController.h"
#import "Post.h"

typedef NS_ENUM(NSInteger, pageType) {
    pageTypeNew,
    pageTypeMore
};

@interface BPageController ()

@property (nonatomic, strong) Post *postManager;
@property (nonatomic, assign) NSInteger page; //当前page
@property (nonatomic, strong) NSString *base;
@end

@implementation BPageController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _page = 1;
        _base = @"0";
    }
    return self;
}

-(void) pageNew{
    [self post:1 byType:pageTypeNew];
}
-(void) pageMore{
    NSInteger tmpPage = _page +1;
    [self post:tmpPage byType:pageTypeMore];
}

-(void) post:(NSInteger) page byType:(pageType)type{
    [SPOST postByPath:[self getPath]
                Param:[self getParam:_page andBase:_base]
             andBlock:^(PostModel *model) {
                 _page = page;
                 _base =model.base;
                 [self resault:model byType:type];
             }
            postFaile:^{
                [_delegate pageError];
            }
                error:^(id error) {
                    [_delegate pageError];
                }];
}

-(void) resault:(PostModel *)model byType:(pageType)type{
    switch (type) {
        case pageTypeNew:
        {
            [_delegate pageNewData:model];
            break;
        }
            
        case pageTypeMore:
        {
            [_delegate pageMoreData:model];
            break;
        }
        default:
            break;
    }
}
-(NSString *)getPath{
    return @"";
}
-(NSDictionary *)getParam:(NSInteger )page andBase:(NSString *)base{
    return @{}.mutableCopy;
}
@end
