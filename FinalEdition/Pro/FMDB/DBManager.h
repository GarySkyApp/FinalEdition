//
//  DBManager.h
//  DelFMDB
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DBManager : NSObject

- (void)insertData:(int)fromIndex useTransaction:(BOOL)useTransaction;
-(void)testDBSpeed;
@end
