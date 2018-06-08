//
//  ViewController.m
//  CircleBtnDemo
//
//  Created by sunparl on 2018/5/25.
//  Copyright © 2018年 self. All rights reserved.
//

#import "ViewController.h"
#import "CircleBtn.h"
#import "BadgeValue.h"

#import "ReactiveObjC.h"
#import "RACDelegateTestVC.h"
@interface ViewController ()

@end
static int count = 0;
@implementation ViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}
-(void)awakeFromNib{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    [super awakeFromNib];
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}
-(void)loadView{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    
    CircleBtn *btn = [[CircleBtn alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor clearColor];
    __weak typeof(btn)weakBtn = btn;
    btn.clickBlock = ^(NSInteger value) {
        BadgeManager.valueStr = [NSString stringWithFormat:@"%ld",(long)value];
        NSLog(@"状态 %d",weakBtn.isSelected);
        if (value==88) {
            RACDelegateTestVC *vc = [[RACDelegateTestVC alloc]init];
            vc.view.backgroundColor = [UIColor whiteColor];
            vc.title = NSStringFromClass([RACDelegateTestVC class]);
            [[vc rac_signalForSelector:@selector(changeBackColor)]subscribeNext:^(RACTuple * _Nullable x) {
                self.view.backgroundColor = [UIColor cyanColor];
            }];
            [self.navigationController pushViewController:vc animated:YES];
        }
    };
    [self.view addSubview:btn];
    
}



-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    [super viewWillAppear:animated];
}
-(void)viewWillLayoutSubviews{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}
-(void)viewDidLayoutSubviews{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}


- (void)didReceiveMemoryWarning {
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"\n:   %d    %s", count++,__FUNCTION__);
}
@end
