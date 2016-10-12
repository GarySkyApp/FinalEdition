//
//  UsrEntity.m
//  DelUsrManager
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#import "UsrEntity.h"

@implementation UsrEntity

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.usrId forKey:@"usrId"];
    [aCoder encodeObject:self.usrName forKey:@"usrName"];
    [aCoder encodeObject:self.usrIntroduce forKey:@"usrIntroduce"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.usrId = [aDecoder decodeObjectForKey:@"usrId"];
        self.usrName = [aDecoder decodeObjectForKey:@"usrName"];
        self.usrIntroduce = [aDecoder decodeObjectForKey:@"usrIntroduce"];
    }
    return self;
}
@end
