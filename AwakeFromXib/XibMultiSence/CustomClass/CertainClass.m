//
//  CertainClass.m
//  AwakeFromXib
//
//  Created by MC on 15/7/25.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "CertainClass.h"

@implementation CertainClass

//File's Owner不能接收此方法
-(void)awakeFromNib{
    NSLog(@"%s",__func__);
    [super awakeFromNib];
}

@end
