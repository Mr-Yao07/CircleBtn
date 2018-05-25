//
//  ViewController.m
//  CircleBtnDemo
//
//  Created by sunparl on 2018/5/25.
//  Copyright © 2018年 self. All rights reserved.
//

#import "ViewController.h"
#import "CircleBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CircleBtn *btn = [[CircleBtn alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
