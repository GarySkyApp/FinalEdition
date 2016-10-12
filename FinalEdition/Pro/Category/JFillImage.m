//
//  JFillImage.m
//  BaseViewController
//
//  Created by hehai on 16/8/30.
//  Copyright © 2016年 J. All rights reserved.
//

#import "JFillImage.h"

@implementation JFillImage

+(void) fillingImage:(UIImageView *)imgView byUrl:(NSString *)url{
    [imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage new]];
}
@end
