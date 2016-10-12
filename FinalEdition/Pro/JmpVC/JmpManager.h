//
//  JmpManager.h
//  Module
//
//  Created by hehai on 16/10/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JmpManager : NSObject
//跳转图片选择器
+(void) jmpAssetPicker;
//跳转图片浏览器
+(void) jmpPhotoBrowser;
//跳转搜索界面
+(void) jmpSearchVC;
//跳转控制器
+(void) jmpVC;
//跳转带参数的控制器
//通知跳转
+(void) jmpVCByNotification:(NSNotification *)notification;
//vc根据跳转类型跳转
//vc类型有多种，每种下，还有对应的子分类跳转



//present to push
+(void) presentVC:(UIViewController *)toVC formVC:(UIViewController *)fromVC withAnimated:(BOOL)animated;
//跳转登录
+(void) jmpLogin;
//跳转预留webView
+(void) jmpReservedWebView;
@end
