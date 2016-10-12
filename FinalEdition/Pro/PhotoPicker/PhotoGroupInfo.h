//
//  PhotoGroupInfo.h
//  Module
//
//  Created by JHG on 16/9/29.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoGroupInfo : NSObject
//组名
@property (nonatomic , copy  ) NSString                 *groupName;

//缩略图
@property (nonatomic , strong) UIImage                  *thumbImage;

//组里面的图片个数
@property (nonatomic , assign) NSInteger                assetsCount;

//类型 : Saved Photos...
@property (nonatomic , copy  ) NSString                 *type;

@property (nonatomic , strong) ALAssetsGroup            *group;
@end
