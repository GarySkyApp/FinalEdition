//
//  UIView+Fram.m
//  Module
//
//  Created by JHG on 16/9/28.
//  Copyright © 2016年 J. All rights reserved.
//

#import "UIView+Fram.h"

@implementation UIView (Fram)

-(CGRect) getRect{
    return self.frame;
}

-(void)setWidth:(CGFloat)width{
    CGRect rect = [self getRect];
    rect.size.width = width;
    self.frame = rect;
}
-(void)setHeight:(CGFloat)height{
    CGRect rect = [self getRect];
    rect.size.height = height;
    self.frame = rect;
}
-(void)setDx:(CGFloat)dx{
    CGRect rect = [self getRect];
    rect.origin.x = dx;
    self.frame = rect;
}
-(void)setDy:(CGFloat)dy{
    CGRect rect = [self getRect];
    rect.origin.y = dy;
    self.frame = rect;
}
@end
