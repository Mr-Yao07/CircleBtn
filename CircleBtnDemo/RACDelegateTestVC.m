//
//  RACDelegateTestVC.m
//  CircleBtnDemo
//
//  Created by sunparl on 2018/6/7.
//  Copyright © 2018年 self. All rights reserved.
//

#import "RACDelegateTestVC.h"
#import "ReactiveObjC.h"
@interface RACDelegateTestVC ()

@end

@implementation RACDelegateTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor cyanColor];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self changeBackColor];
    }];
    [self.view addSubview:btn];
}
-(void)changeBackColor{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
