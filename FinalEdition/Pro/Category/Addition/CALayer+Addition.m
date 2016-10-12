//
//  CALayer+Addition.m
//  CosmoLove
//
//  Created by Gary on 15/11/26.
//  Copyright © 2015年 Gary. All rights reserved.
//

#import "CALayer+Addition.h"
#import <objc/runtime.h>

@implementation CALayer (Additions)

//static const void *borderColorFromUIColorKey = &borderColorFromUIColorKey;
//@dynamic borderColorFromUIColor;

- (UIColor *)borderColorFromUIColor {
    return objc_getAssociatedObject(self, @selector(borderColorFromUIColor));
}
-(void)setBorderColorFromUIColor:(UIColor *)color
{
    objc_setAssociatedObject(self, @selector(borderColorFromUIColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBorderColorFromUI: [self borderColorFromUIColor]];
}

- (void)setBorderColorFromUI:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

//TODO




@end
