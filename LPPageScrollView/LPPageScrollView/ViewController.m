//
//  ViewController.m
//  LPPageScrollView
//
//  Created by MacBook on 15/8/19.
//  Copyright (c) 2015年 LiPeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) LPPageScrollView *pageScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBar.hidden = YES;
    
    self.pageScrollView = [[LPPageScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    self.pageScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.pageScrollView];
//    self.pageScrollView.center = self.view.center;
    
    self.pageScrollView.coverImages = @[@"1", @"2", @"3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
