//
//  ViewController.m
//  AwakeFromXib
//
//  Created by MC on 15/7/21.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "ViewController.h"
#import "XibViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    XibViewController *vc = [[XibViewController alloc]initWithNibName:@"XibViewController" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
