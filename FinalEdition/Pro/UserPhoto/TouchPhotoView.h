//
//  TouchPhotoView.h
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#import "FlagImageView.h"

@interface TouchPhotoView : FlagImageView

- (void)addTarget:(nullable id)target action:(SEL)action;
@end
