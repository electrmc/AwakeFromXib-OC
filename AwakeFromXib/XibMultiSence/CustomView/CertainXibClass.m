//
//  CertainXibClass.m
//  AwakeFromXib
//
//  Created by MC on 15/7/25.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "CertainXibClass.h"

@implementation CertainXibClass

-(id)init{
    self = [super init];
    if (self) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"XibClassBeCertain" owner:nil options:nil];
        self = views[0];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"%s",__func__);
    self  = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

+(instancetype)viewFromXib{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"XibClassBeCertain" owner:nil options:nil];
    return views[0];
}

-(void)awakeFromNib{
    NSLog(@"%s",__func__);
    self.backgroundColor = [UIColor redColor];
    self.label.backgroundColor = [UIColor whiteColor];
}

- (IBAction)btn:(id)sender {
    NSLog(@"btn's action is done in uiview, this donot follow MVC");
}
@end
