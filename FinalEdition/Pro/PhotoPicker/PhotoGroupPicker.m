//
//  PhotoGroupPicker.m
//  Module
//
//  Created by JHG on 16/9/29.
//  Copyright © 2016年 J. All rights reserved.
//

#import "PhotoGroupPicker.h"
#import "PhotoGroupInfo.h"

@implementation PhotoGroupPicker

+(void) getAllGroupAllPhotos:(BOOL)allPhotos withResource : (groupCallBackBlock ) callBack {
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    NSMutableArray *groups = [NSMutableArray array];
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            if (allPhotos){
                [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            }else{
                [group setAssetsFilter:[ALAssetsFilter allVideos]];
            }
            // 包装一个模型来赋值
            PhotoGroupInfo *pickerGroup = [[PhotoGroupInfo alloc] init];
            pickerGroup.group = group;
            pickerGroup.groupName = [group valueForProperty:@"ALAssetsGroupPropertyName"];
            pickerGroup.thumbImage = [UIImage imageWithCGImage:[group posterImage]];
            pickerGroup.assetsCount = [group numberOfAssets];
            [groups addObject:pickerGroup];
        }else{
            callBack(groups);
        }
    };
    NSInteger type = ALAssetsGroupAll;
    [library enumerateGroupsWithTypes:type usingBlock:resultBlock failureBlock:nil];
}

@end
