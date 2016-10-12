//
//  ItemView.h
//  DelToolView
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

/*
    设置Constraint的值来撑起View的宽度
 */

#import <UIKit/UIKit.h>

@interface ItemView : UIView

-(void) setItemText:(NSString *)text;
-(void) setItemFont:(UIFont *)font;
-(void) setItemTextColor:(UIColor *)color;
-(void) setItemSel:(SEL)sel andTarget:(id)target;
@end
