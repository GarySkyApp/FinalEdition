//
//  ToolNavView.h
//  ToolNavView
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemView.h"

@interface ToolNavView : UIView

-(void) setLeftItem:(ItemView *)leftItem;
-(void) setRightItem:(ItemView *)rightItem;
-(void) setToolTitle:(NSString *)title;
-(void) setToolTitleFont:(UIFont *)font;
-(void) setToolTitleColor:(UIColor *)color;
@end
