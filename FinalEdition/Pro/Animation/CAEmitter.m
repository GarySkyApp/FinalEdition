
//
//  CAEmitter.m
//  DelCAEmitterLayer
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

#import "CAEmitter.h"

@implementation CAEmitter

+(CAEmitterLayer *)create:(CGRect) bounds{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = bounds;
    //决定粒子发射形状的中心点
    emitter.emitterPosition = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    emitter.emitterZPosition = 3.0;
    emitter.emitterShape = kCAEmitterLayerLine;//发射器形状
    emitter.emitterMode = kCAEmitterLayerOutline;//3d圆形的体积内发射
    emitter.birthRate = 1.f;
    
    emitter.preservesDepth = YES; //是否开启三维空间模式
    emitter.emitterDepth = 2.0;//发射器的深度，有时可能会产生立体效果
    emitter.spin = 50;//粒子的旋转角度
    emitter.seed = 0;
    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;//渲染模式
    //emitter.emitterPosition = CGPointMake(emitter.frame.size.width /2.0, emitter.frame.size.height / 2.0);
    
    //creat a particle template]
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"icon_showlove_like1.png"].CGImage);
    cell.birthRate = 0.5;
    cell.lifetime = 8;
    cell.enabled = YES;//是否打开粒子的渲染效果
    //  cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = 1;
    
    cell.velocity = 70; //粒子的速度
    cell.velocityRange = 1;//粒子的速度范围
    cell.emissionRange = M_PI * 2.0;
//    cell.emissionLongitude = 90;

    emitter.emitterCells = @[cell];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [emitter removeFromSuperlayer];
//    });
//    
    
    return emitter;
}

@end
