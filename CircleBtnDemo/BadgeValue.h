//
//  BadgeValue.h
//  CircleBtnDemo
//
//  Created by sunparl on 2018/6/6.
//  Copyright © 2018年 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#define BadgeManager [BadgeValue shareInstance]

/**
 BadgeValue单例类
 */
@interface BadgeValue : NSObject
+(instancetype)shareInstance;

@property (nonatomic,strong) UITabBarItem *tabBarItem;
/**
 badgeValue 供全局使用的值
 */
@property (nonatomic,copy) NSString *valueStr;
@end
