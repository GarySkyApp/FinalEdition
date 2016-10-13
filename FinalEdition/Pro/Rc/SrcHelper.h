//
//  SrcHelper.h
//  DelPost
//
//  Created by hehai on 16/10/13.
//  Copyright © 2016年 J. All rights reserved.
//

#ifndef SrcHelper_h
#define SrcHelper_h
#import <Foundation/Foundation.h>

//config SDK
extern NSString *const UmengKey;
extern NSString *const WanTuKey;

//config service
#if DEBUG
extern NSString *const BaseUrl;
#else
extern NSString *const BaseUrl;
#end

#endif
