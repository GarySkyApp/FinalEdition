//
//  PageManager.h
//  Module
//
//  Created by JHG on 16/9/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, PageManagerType) {
    PageManagerMore,
    PageManagerNoMore
};

@interface PageManager : NSObject

+(PageManagerType) page:(NSInteger)currentPage andTotalPage:(NSInteger)totalPage;

@end
