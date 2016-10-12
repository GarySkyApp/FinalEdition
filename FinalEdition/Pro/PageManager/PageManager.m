//
//  PageManager.m
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import "PageManager.h"

@implementation PageManager

+(PageManagerType) page:(NSInteger)currentPage andTotalPage:(NSInteger)totalPage{
    if (currentPage < totalPage) {
        return PageManagerMore;
    }else{
        return PageManagerNoMore;
    }
}

@end
