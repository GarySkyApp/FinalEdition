//
//  NSNumber+Arithmetic.h
//  Module
//
//  Created by JHG on 16/9/28.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Arithmetic)

-(NSNumber *) addDouble:(double) num;
-(NSNumber *) substractDouble: (double) num;

-(NSNumber *) addInt:(int) num;
-(NSNumber *) substractInt: (double) num;

-(NSNumber *) multiply: (double) num;
-(NSNumber *) divide: (double) num;
@end
