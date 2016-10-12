//
//  ToolView.h
//  DelToolView
//
//  Created by JHG on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//
/*

 注意：
 1、只能使用一次leftItem和rightItem，如果使用两次，必须清除一次
 2、setTextView只能是在竖屏下，因为没有适配在横屏状态下
 3、使用的时候，需要将item等的frame设置好，因为要获取其一些属性
 */

#import <UIKit/UIKit.h>
#import "ItemView.h"

@interface ToolView : UIView

@property (nonatomic, strong) UILabel *toolTitle;
@property (nonatomic, strong) ItemView *leftItem;
@property (nonatomic, strong) ItemView *rightItem;
@property (nonatomic, strong) ItemView *textView;
@property (nonatomic, strong) UIColor *mainColor;

-(void) configToolTitle:(NSString *)title;
-(void) configToolTitleFont:(UIFont *)font;
-(void) configToolTitleColor:(UIColor *)color;
@end
