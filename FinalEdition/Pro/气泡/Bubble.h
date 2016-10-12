//
//  Bubble.h
//  Module
//
//  Created by JHG on 16/9/28.
//  Copyright © 2016年 J. All rights reserved.
//

/**
 
    setImage:andBubble:andLeftCapWidth:topCapHeight:
 设置聊天气泡样式.
 原理是使用气泡绘制出来的layer作为显示区域
    leftCapWidth 左边距拉伸
    topCapHeight 上边距拉伸
 
 
 */

#import <UIKit/UIKit.h>

@interface Bubble : UIImageView

-(void) setImage:(UIImage *)image andBubble:(UIImage *)bubbleImage andLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;
@end
