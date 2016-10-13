
//
//  BViewController.m
//  FinalEdition
//
//  Created by hehai on 16/10/13.
//  Copyright © 2016年 J. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
<
BPageControllerDelegate
>

@property (nonatomic, strong) BPageController *pageManager;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pageManager interface
-(void) setPageManager:(BPageController *)pageManager{
    _pageManager = pageManager;
    _pageManager.delegate = self;
}
-(void) getNewData{
    [_pageManager pageNew];
}
-(void) getMoreData{
    [_pageManager pageMore];
}

#pragma mark - BPageControllerDelegate
-(void)pageNewData:(PostModel *)model{
    
}
-(void)pageMoreData:(PostModel *)model{
    
}
-(void)pageError{
    //end UI Rerush
}
@end
