//
//  BFilletImageView.m
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#import "BFilletImageView.h"

@implementation BFilletImageView

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect rect = self.frame;
    self.layer.cornerRadius = rect.size.height * 0.5;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
