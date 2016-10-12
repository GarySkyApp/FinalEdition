
//
//  ToolNavView.m
//  ToolNavView
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "ToolNavView.h"
#import "ToolView.h"
#import "Masonry.h"

@interface ToolNavView ()

@property (nonatomic, strong) ToolView *toolView;
@end

@implementation ToolNavView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.toolView];
        [self configConstraints];
        [self configDefaultSetting];
    }
    return self;
}
-(void) configConstraints{
    [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).with.offset(20);
        make.right.equalTo(self);
        make.height.equalTo(@44);
    }];
}
-(void) configDefaultSetting{
     [self setBackgroundColor:[[UIColor darkGrayColor] colorWithAlphaComponent:0.8]];
}
-(ToolView *)toolView{
    if (!_toolView) {
        _toolView = [[ToolView alloc] init];
    }
    return _toolView;
}
-(void) setLeftItem:(ItemView *)leftItem{
    self.toolView.leftItem = leftItem;
}
-(void) setRightItem:(ItemView *)rightItem{
    self.toolView.rightItem = rightItem;
}
-(void) setToolTitle:(NSString *)title{
    self.toolView.toolTitle.text = title;
}
-(void) setToolTitleFont:(UIFont *)font{
    [self.toolView configToolTitleFont:font];
}
-(void) setToolTitleColor:(UIColor *)color{
    [self.toolView configToolTitleColor:color];
}
@end
