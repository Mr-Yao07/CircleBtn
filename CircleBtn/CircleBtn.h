//
//  CircleBtn.h
//  CircleBtnDemo
//
//  Created by sunparl on 2018/5/25.
//  Copyright © 2018年 self. All rights reserved.
//

#import <UIKit/UIKit.h>
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomLightColor random(arc4random_uniform(128), arc4random_uniform(128), arc4random_uniform(128), arc4random_uniform(128))

@interface TouchLayer : CAShapeLayer
@end

@interface CircleBtn : UIView
-(instancetype)initWithFrame:(CGRect)frame;
@end
