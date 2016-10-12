//
//  StringCheack.h
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#ifndef StringCheack_h
#define StringCheack_h

#import <UIKit/UIKit.h>

//检查字符串是否为nil
#define CheackNil(str) str?str:@""
//检查字符串是否为nil，如果是，根据def返回默认值
#define CheackNilWithDefault(str,def) str?str:def
//字符串拼接
static inline NSString * SpliceStr(NSString *str1, NSString *str2){
    NSString *resault = [[NSString alloc]init];
    resault = [str1 stringByAppendingString:str2];
    return resault;
}

#endif /* StringCheack_h */
