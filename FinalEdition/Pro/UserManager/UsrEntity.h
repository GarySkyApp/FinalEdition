//
//  UsrEntity.h
//  DelUsrManager
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsrEntity : NSObject<NSCoding>

@property (nonatomic, strong) NSString *usrId;
@property (nonatomic, strong) NSString *usrName;
@property (nonatomic, strong) NSString *usrIntroduce;
@end
