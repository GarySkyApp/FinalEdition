//
//  CALayer+Addition.h
//  CosmoLove
//
//  Created by Gary on 15/11/26.
//  Copyright © 2015年 Gary. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Additions)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;

- (UIColor *)borderColorFromUIColor;
- (void)setBorderColorFromUIColor:(UIColor *)color;
- (void)setBorderColorFromUI:(UIColor *)color;


@end
