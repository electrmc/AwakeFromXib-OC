//
//  XibViewController.m
//  AwakeFromXib
//
//  Created by MC on 15/7/23.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "XibViewController.h"
#import "XibView.h"
#import "CertainClass.h"
#import "CertainXibClass.h"
#import "ReuseViewController.h"

@interface XibViewController ()
@property (strong, nonatomic) IBOutlet XibViewController *testObject;

@property(weak, nonatomic) IBOutlet UIView *FileOwnerBeSelf;
@property(nonatomic,strong)UIView *fileOwnerBeNil;
@property(nonatomic,strong)UIView *fileOwnerBeCertain;
@property(nonatomic,strong)ReuseViewController *xibReuseController;
@end

@implementation XibViewController

-(id)init{
    NSLog(@"%s",__func__);
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"%s",__func__);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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

-(void)awakeFromNib{
    NSLog(@"%s",__func__);
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadFileOwnerBeNil];
    [self loadFileOwnerBeSelf];
    [self loadFileOwnerBeCertain];
    [self loadXibClassBeCertain];
    [self loadXibViewController];
    [self loadMultiViewFromXib];
    [self loadXibContainObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 * 1，File's Owner == nil,view的Class == nil
 * 加载出的视图大小是确定的，但是在父视图中的位置是不确定的
 */
-(void)loadFileOwnerBeNil{
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"FileOwnerBeNil" owner:nil options:nil];
    self.fileOwnerBeNil = views[0];
    CGRect rect = _fileOwnerBeNil.frame;
    rect.origin.x += 40.f;
    rect.origin.y += 100.f;
    _fileOwnerBeNil.frame = rect;
    [self.view addSubview:_fileOwnerBeNil];
}

/*
 * 2，File's Owner == nil,view的Class == CustomView
 * View的Class必须是与Xib文件中View的类型相同，或是起父类。一般是UIView
 */

-(void)loadXibClassBeCertain{
//    UIView *xibClassBeCertain = [CertainXibClass viewFromXib];
    UIView *xibClassBeCertain = [[CertainXibClass alloc]init];
    CGRect rect = xibClassBeCertain.frame;
    rect.origin.x += 40.f;
    rect.origin.y += 250.f;
    xibClassBeCertain.frame = rect;
    [self.view addSubview:xibClassBeCertain];
}

/*
 * 3，File's Owner == self(当前视图控制器),view的Class == nil
 * 建立了一个从该xib的view到self的IBOutlet
 * 只要self主动调用Load Xib的方法，self持有的IBOutlet指向的视图就会被初始化
 * 不需要view[0]的方式存取视图，通过IBOutlet的属性进行存取
 * File's Owner不为nil的视图属于专属视图，在工程中不应该被复用
 */
-(void)loadFileOwnerBeSelf{

    [[NSBundle mainBundle]loadNibNamed:@"FileOwnerBeSelf" owner:self options:nil];
    CGRect rect = _FileOwnerBeSelf.frame;
    rect.origin.x += 40.f;
    rect.origin.y += 150.f;
    _FileOwnerBeSelf.frame = rect;
    [self.view addSubview:_FileOwnerBeSelf];
}

/*
 * 4，File's Owner == CustomClass(任意NSObject的类)，view的class == nil
 * File's Owner的类可以封装视图中的各种逻辑，而不仅仅提供视图内容
 * 只要File's Owner主动调用Load Xib的方法，File's Owner持有的IBOutlet指向的视图就会被初始化
 */
-(void)loadFileOwnerBeCertain{
    CertainClass *certainInstance = [CertainClass new];
    [[NSBundle mainBundle] loadNibNamed:@"FileOwnerBeCertain" owner:certainInstance options:nil];
    self.fileOwnerBeCertain = certainInstance.customView;
    
    CGRect rect = _fileOwnerBeCertain.frame;
    rect.origin.x += 40.f;
    rect.origin.y += 200.f;
    _fileOwnerBeCertain.frame = rect;
    [self.view addSubview:_fileOwnerBeCertain];
}

/*
 * 5，File's Owner == CustomController,view的Class == nil
 * 这是功能强大的定制，可以在CustomController中定制view，并且完成事件的逻辑处理
 */

-(void)loadXibViewController{
    self.xibReuseController = [[ReuseViewController alloc]initWithNibName:@"ReuseView" bundle:[NSBundle mainBundle]];
    UIView *view = self.xibReuseController.view;
    
    CGRect rect = view.frame;
    rect.origin.x += 40.f;
    rect.origin.y += 350.f;
    view.frame = rect;
    [self.view addSubview:view];
}

/*
 * 6，当有多个视图时，views的顺序就是xib中view的排列顺序
 */
-(void)loadMultiViewFromXib{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MultiView" owner:nil options:nil];
    UIView *viewContainer = [[UIView alloc]initWithFrame:CGRectMake(30, 400, 270, 200)];
    viewContainer.layer.borderWidth = 2.0f;
    viewContainer.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:viewContainer];
    for (int i=0;i<views.count; i++) {
        UIView *v = views[i];
        if ([v isMemberOfClass:[UITableView class]]) {
            NSLog(@"this is tableView");
            v = (UITableView*)v;
        }
        if ([v isMemberOfClass:[UIImageView class]]) {
            NSLog(@"this is UIImageView");
            v = (UIImageView*)v;
        }
        if ([v isMemberOfClass:[UIView class]]) {
            NSLog(@"this is UIView");
            v = (UIView*)v;
        }
        
        CGRect rect = v.frame;
        rect.origin.x += 5.f;
        rect.origin.y += 75.0*i+5;
        v.frame = rect;
        [viewContainer addSubview:v];
        
    }
}

-(void)loadXibContainObject{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"ObjectInXib" owner:nil options:nil];
    [self.view addSubview:views[0]];
}

@end
