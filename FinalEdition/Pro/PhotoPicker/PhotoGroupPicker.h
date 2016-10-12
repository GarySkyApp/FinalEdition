//
//  PhotoGroupPicker.h
//  Module
//
//  Created by JHG on 16/9/29.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^groupCallBackBlock)(NSArray *assets);;

@interface PhotoGroupPicker : NSObject

+ (void) getAllGroupAllPhotos:(BOOL)allPhotos withResource : (groupCallBackBlock ) callBack;

@end
