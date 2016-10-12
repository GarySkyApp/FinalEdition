//
//  NSNumber+Arithmetic.m
//  Module
//
//  Created by JHG on 16/9/28.
//  Copyright © 2016年 J. All rights reserved.
//

#import "NSNumber+Arithmetic.h"

@implementation NSNumber (Arithmetic)

-(NSNumber *) addDouble:(double)num
{
    return [NSNumber numberWithDouble:([self doubleValue] + num)];
}
-(NSNumber *) substractDouble:(double)num
{
    return [NSNumber numberWithDouble:([self doubleValue] - num)];
}
-(NSNumber *) addInt:(int) num{
     return [NSNumber numberWithDouble:([self intValue] + num)];
}
-(NSNumber *) substractInt: (double) num{
     return [NSNumber numberWithDouble:([self intValue] - num)];
}
-(NSNumber *) multiplyDouble:(double)num
{
    return [NSNumber numberWithDouble:([self doubleValue] * num)];
}
-(NSNumber *) divideDouble:(double) num
{
    return [NSNumber numberWithDouble:([self doubleValue] / num)];
}
@end
