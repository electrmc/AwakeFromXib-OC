//
//  XibView.m
//  AwakeFromXib
//
//  Created by MC on 15/7/23.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "XibView.h"

@implementation XibView

-(id)init{
    NSLog(@"%s",__func__);
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"%s",__func__);
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    NSLog(@"%s",__func__);
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib{
    NSLog(@"%s",__func__);
    [super awakeFromNib];

}

@end
