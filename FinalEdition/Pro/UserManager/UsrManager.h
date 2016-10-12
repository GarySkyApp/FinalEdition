//
//  UsrManager.h
//  DelUsrManager
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#define UsrFileName @""

#import <Foundation/Foundation.h>
#import "UsrEntity.h"

@interface UsrManager : NSObject

+(UsrManager *) shareUsrInfo;
//加载/保存用户信息
-(void) usr_load;
-(void) usr_save;
-(void) usr_update:(UsrEntity *)usrEntity;
-(void) usr_LoginOut;

-(BOOL) usr_isLogin;
@end
