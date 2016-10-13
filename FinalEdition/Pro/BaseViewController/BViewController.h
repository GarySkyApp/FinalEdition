//
//  BViewController.h
//  FinalEdition
//
//  Created by hehai on 16/10/13.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPageController.h"

@interface BViewController : UIViewController

-(void) setPageManager:(BPageController *)pageManager;
-(void) getNewData;
-(void) getMoreData;
@end
