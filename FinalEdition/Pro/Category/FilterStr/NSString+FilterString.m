//
//  NSString+FilterString.m
//  CosmoLove
//
//  Created by 时尚致爱 on 16/9/23.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "NSString+FilterString.h"

@implementation NSString (FilterString)
+ (NSString *)filterStrwithcharacters:(NSString *)characterstr{

    NSString * s;
    NSMutableString * mutstr = [NSMutableString string];
    for (int i = 0; i < characterstr.length; i ++) {
        
        s =[characterstr substringWithRange:NSMakeRange(i, 1)];
        
        if ([s isEqualToString:@"\n"] && i > 0) {
            
            NSString * pre = [characterstr substringWithRange:NSMakeRange(i-1, 1)];
            if ([pre  isEqualToString: @"，"] ||[pre  isEqualToString: @"。"]||[pre  isEqualToString: @"！"]||[pre  isEqualToString: @"？"]) {
                
                NSLog(@"有个有个有个");
                
            }else {
                
                [mutstr appendString:@" "];
            }
            continue;
        }
        [mutstr appendString:s];
    }
    return mutstr;
}

@end
