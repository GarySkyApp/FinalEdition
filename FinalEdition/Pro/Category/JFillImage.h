//
//  JFillImage.h
//  BaseViewController
//
//  Created by hehai on 16/8/30.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"

@interface JFillImage : NSObject

+(void) fillingImage:(UIImageView *)imgView byUrl:(NSString *)url;
@end
