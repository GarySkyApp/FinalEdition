//
//  CompressImage.h
//  DelCollectionView
//
//  Created by JHG on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

/*
    图片压缩
 1、thumbnailForAsset 为压缩图片，size为压缩时，图片的最大尺寸
 2、imageWithDefaultRepresentationByAsset根据asset取原图
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>

@interface CompressImage : NSObject

+(UIImage *)thumbnailForAsset:(ALAsset *)asset maxPixelSize:(NSUInteger)size;
+(UIImage *)imageWithDefaultRepresentationByAsset:(ALAsset *)asset;
@end
