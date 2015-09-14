//
//  ObjectInXib.h
//  AwakeFromXib
//
//  Created by MC on 15/8/10.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomObjecInXib;
@class ExternalObject;
@interface ObjectInXib : UIView

@property(nonatomic,retain) IBOutlet CustomObjecInXib *objectInXib;
@property (weak, nonatomic) IBOutlet ExternalObject *ExternalObject;

@end
