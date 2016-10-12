//
//  Bubble.m
//  Module
//
//  Created by JHG on 16/9/28.
//  Copyright © 2016年 J. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

-(void) setImage:(UIImage *)image andBubble:(UIImage *)bubbleImage andLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bubbleImage];
    self.layer.mask = imgView.layer;
    [self setImage:image];
}
@end
