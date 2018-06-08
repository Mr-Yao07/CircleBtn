//
//  BadgeValue.m
//  CircleBtnDemo
//
//  Created by sunparl on 2018/6/6.
//  Copyright © 2018年 self. All rights reserved.
//

#import "BadgeValue.h"
#import "AppDelegate.h"
#import "ReactiveObjC.h"
@implementation BadgeValue
static BadgeValue *bv = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bv = [[BadgeValue alloc]init];
        [[bv rac_valuesForKeyPath:@"valueStr" observer:bv]subscribeNext:^(NSString *valueStr) {
            bv.tabBarItem.badgeValue = valueStr;
        }];
    });
    return bv;
}

-(UITabBarItem *)tabBarItem{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UITabBarController *tab = (UITabBarController *)appDelegate.window.rootViewController;
    UITabBarItem *barItem = tab.viewControllers[0].tabBarItem;
    return barItem;
}

@end
