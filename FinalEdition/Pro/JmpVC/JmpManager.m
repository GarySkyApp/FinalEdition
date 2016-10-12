
//
//  JmpManager.m
//  Module
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "JmpManager.h"

@implementation JmpManager


+(void) presentVC:(UIViewController *)toVC formVC:(UIViewController *)fromVC withAnimated:(BOOL)animated{
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:toVC];
    [fromVC.navigationController presentViewController:nav animated:animated completion:nil];
}
@end
