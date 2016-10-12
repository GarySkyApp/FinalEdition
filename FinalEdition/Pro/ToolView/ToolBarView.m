//
//  ToolBarView.m
//  ToolBarView
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "ToolBarView.h"
#import "ToolView.h"
#import "Masonry.h"

@interface ToolBarView ()

@property (nonatomic, strong) ToolView *toolView;
@end

@implementation ToolBarView

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
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(self);
    }];
}
-(void) configDefaultSetting{
    [self setBackgroundColor:[[UIColor darkGrayColor] colorWithAlphaComponent:0.8]];
    ItemView *preview = [[ItemView alloc] init];
    [preview setItemSel:@selector(previewAction) andTarget:self];
    [preview setItemText:@"预览"];
    
    ItemView *finish = [[ItemView alloc] init];
    [finish setItemSel:@selector(finishAction) andTarget:self];
    [finish setItemTextColor:[UIColor greenColor]];
    [finish setItemText:@"完成"];
    
    self.toolView.leftItem = preview;
    self.toolView.rightItem = finish;
}
-(ToolView *)toolView{
    if (!_toolView) {
        _toolView = [[ToolView alloc] init];
    }
    return _toolView;
}
-(void) previewAction{
    
}
-(void) finishAction{
    
}
@end
