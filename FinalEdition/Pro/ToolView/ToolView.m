//
//  ToolView.m
//  DelToolView
//
//  Created by JHG on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "ToolView.h"
#import "Masonry.h"

@implementation ToolView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.toolTitle];
        [self configConstraints];
        [self configDefaultSetting];
    }
    return self;
}
-(void) configConstraints{
    [_toolTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}
-(void) configDefaultSetting{
    [self setBackgroundColor:[UIColor clearColor]];
}
-(UILabel *)toolTitle{
    if (!_toolTitle) {
        _toolTitle = [[UILabel alloc] init];
        _toolTitle.textColor = [UIColor whiteColor];
        _toolTitle.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    }
    return _toolTitle;
}
-(void)setLeftItem:(ItemView *)leftItem{
    _leftItem = leftItem;
    [self addSubview:_leftItem];
    [_leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(8);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
    }];
}
-(void)setRightItem:(ItemView *)rightItem{
    _rightItem = rightItem;
    [self addSubview:_rightItem];
    [_rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-8);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
    }];
}
-(void)setTextView:(ItemView *)textView{
    _textView = textView;
    [self addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.equalTo(self);
    }];

}
-(void)setMainColor:(UIColor *)mainColor{
    _mainColor = mainColor;
    [self setBackgroundColor:_mainColor];
}
-(void) configToolTitle:(NSString *)title{
    _toolTitle.text = title;
}
-(void) configToolTitleFont:(UIFont *)font{
    _toolTitle.font = font;
}
-(void) configToolTitleColor:(UIColor *)color{
    _toolTitle.textColor = color;
}
@end
