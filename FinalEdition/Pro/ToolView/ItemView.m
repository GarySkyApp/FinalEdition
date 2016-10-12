//
//  ItemView.m
//  DelToolView
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "ItemView.h"
#import "Masonry.h"

@interface ItemView ()

@property (nonatomic, strong) UIButton *btn;
@end

@implementation ItemView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.btn];
        [self configConstraints];
        [self configDefaultSetting];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.btn];
        [self configConstraints];
        [self configDefaultSetting];
    }
    return self;
}
-(void) configConstraints{
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
-(void) configDefaultSetting{
    
}
-(UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        [_btn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _btn;
}

-(void) setItemText:(NSString *)text{
    [_btn setTitle:text forState:UIControlStateNormal];
}
-(void) setItemFont:(UIFont *)font{
    _btn.titleLabel.font = font;
}
-(void) setItemTextColor:(UIColor *)color{
    [_btn setTitleColor:color forState: UIControlStateNormal];
}
-(void) setItemSel:(SEL)sel andTarget:(id)target{
    [_btn addTarget:target action:sel forControlEvents: UIControlEventTouchUpInside];
}
@end
