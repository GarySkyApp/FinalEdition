
//
//  UsrManager.m
//  DelUsrManager
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#import "UsrManager.h"

@interface UsrManager ()

@property (nonatomic, strong) UsrEntity *entity;
@end

@implementation UsrManager


+(UsrManager *) shareUsrInfo{
    __strong static UsrManager *_shareObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareObj = [[UsrManager alloc] init];
        [_shareObj usr_load];
    });
    return _shareObj;
}

-(void)usr_load{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:UsrFileName];
    _entity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
-(void) usr_save{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_entity];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:UsrFileName];
}
-(void) usr_update:(UsrEntity *)usrEntity{
    _entity = usrEntity;
    [self usr_save];
}
-(void)usr_LoginOut{
    _entity = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UsrFileName];
}
-(BOOL)usr_isLogin{
    if (_entity == nil) {
        return NO;
    }else{
        return YES;
    }
}

@end
