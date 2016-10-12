//
//  Calculagraph.m
//  DelTabBarController
//
//  Created by hehai on 16/10/12.
//  Copyright © 2016年 J. All rights reserved.
//

#import "Calculagraph.h"
#import<libkern/OSAtomic.h>

@implementation Calculagraph

- (void)start
{
    __block int32_t timeOutCount=5;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 5, dispatch_get_main_queue());
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        OSAtomicDecrement32(&timeOutCount);
        NSLog(@"   %d", timeOutCount);
        sleep(10);
        if (timeOutCount == 0) {
            NSLog(@"timersource cancel");
            dispatch_source_cancel(timer);
        }
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"timersource cancel handle block");
    });
    dispatch_resume(timer);
}
@end
