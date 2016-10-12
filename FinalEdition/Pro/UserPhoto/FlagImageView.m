//
//  FlagImageView.m
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#import "FlagImageView.h"

#define FlagPod 15

@implementation FlagImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect rect = self.bounds;
    self.filletView.frame = rect;
    self.flagView.frame = CGRectMake(0, 0, FlagPod, FlagPod);
    self.flagView.center = CGPointMake(CGRectGetMaxX(rect)-FlagPod*0.5, CGRectGetMaxY(rect)-FlagPod*0.5);
}

-(void)setUI{
    [self addSubview:self.filletView];
    [self addSubview:self.flagView];
}

-(UIImageView *)flagView{
    if (!_flagView) {
        _flagView = [[UIImageView alloc] init];
    }
    return _flagView;
}
-(BFilletImageView *)filletView{
    if (!_filletView) {
        _filletView = [[BFilletImageView alloc] init];
    }
    return _filletView;
}

-(void) setPhoto:(NSString *)PhotoPath andFlag:(NSString *)flagPath{
    [self.filletView setImage:[UIImage imageNamed:CheackNil(PhotoPath)]];
    [self.flagView setImage:[UIImage imageNamed:CheackNil(flagPath)]];
}
@end
