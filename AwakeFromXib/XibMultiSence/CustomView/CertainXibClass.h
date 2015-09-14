//
//  CertainXibClass.h
//  AwakeFromXib
//
//  Created by MC on 15/7/25.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CertainXibClass : UIView
@property(nonatomic,weak)IBOutlet UILabel *label;
- (IBAction)btn:(id)sender;
+(instancetype)viewFromXib;

@end
