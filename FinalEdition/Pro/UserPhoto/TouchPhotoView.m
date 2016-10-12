//
//  TouchPhotoView.m
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#import "TouchPhotoView.h"

@interface TouchPhotoView (){
    __weak id actionTarget;
    SEL actionSel;
}
@end

@implementation TouchPhotoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (void)addTarget:(nullable id)target action:(SEL)action{
    actionTarget = target;
    actionSel = action;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [actionTarget performSelector:actionSel withObject:self];
}
@end
