//
//  FlagImageView.h
//  Module
//
//  Created by JHG on 16/9/26.
//  Copyright © 2016年 J. All rights reserved.
//

#import "BFilletImageView.h"

@interface FlagImageView : UIView

@property (nonatomic, strong) UIImageView *flagView;
@property (nonatomic, strong) BFilletImageView *filletView;

-(void) setPhoto:(NSString *)PhotoPath andFlag:(NSString *)flagPath;
@end
