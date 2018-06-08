//
//  CircleBtn.m
//  CircleBtnDemo
//
//  Created by sunparl on 2018/5/25.
//  Copyright © 2018年 self. All rights reserved.
//

#import "CircleBtn.h"
@interface TouchLayer()
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,assign)BOOL isSelected;
@property(nonatomic,assign)CGFloat starAngle;
@property(nonatomic,assign)CGFloat endAngle;
@end
@implementation TouchLayer
@end




@interface CircleBtn()

/**
 大圆的半径
 */
@property(nonatomic,assign)CGFloat bigRadius;

/**
 小圆的半径
 */
@property(nonatomic,assign)CGFloat smallRadius;
@end

@implementation CircleBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _bigRadius = frame.size.width/2;
        _smallRadius = _bigRadius/2;
        CGPoint center = CGPointMake(self.bounds.origin.x+_bigRadius,self.bounds.origin.y+_bigRadius);
        NSArray *colorArray = @[[UIColor orangeColor],[UIColor cyanColor],[UIColor orangeColor],[UIColor grayColor],[UIColor darkTextColor],[UIColor darkGrayColor]];
        CGFloat num = 4;
        CGFloat startAngle = (M_PI*2)*0.125;
        CGFloat spaceAngle = (M_PI*2)*(1/num);
        for (int i = 0; i<num; i++) {
            
//          绘制曲线
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path addArcWithCenter:center radius:_bigRadius startAngle:startAngle endAngle:startAngle + spaceAngle clockwise:YES];
            [path addArcWithCenter:center radius:_smallRadius startAngle:startAngle + spaceAngle endAngle:startAngle clockwise:NO];
            [path closePath];
            
//          根据曲线绘制视图
            TouchLayer *layer = [TouchLayer layer];
            UIColor *color = colorArray[i];
            layer.fillColor = color.CGColor;
            layer.strokeColor = [UIColor grayColor].CGColor;
            layer.path = path.CGPath;
            layer.selectIndex = i;
            layer.starAngle = startAngle;
            layer.endAngle = startAngle + spaceAngle;
            
            [self.layer addSublayer:layer];
            
            startAngle = startAngle + spaceAngle;
        }
//      中心圆的绘制
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:center radius:_smallRadius-3 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        TouchLayer *layer = [TouchLayer layer];
        layer.fillColor = randomLightColor.CGColor;
        layer.strokeColor = [UIColor grayColor].CGColor;
        layer.path = path.CGPath;
        layer.selectIndex = 88;
        [self.layer addSublayer:layer];
        
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TouchLayer *selfLayer = (TouchLayer *)self.layer;
    CGPoint center = CGPointMake(self.bounds.origin.x+_bigRadius,self.bounds.origin.y+_bigRadius);
    for (TouchLayer *layer in selfLayer.sublayers) {
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, [touches.anyObject locationInView:self], 0) && layer.isSelected == NO) {
            NSLog(@"点到了我,我是第%ld个",(long)layer.selectIndex);
            layer.isSelected = YES;
            self.isSelected = layer.isSelected;
            self.clickBlock(layer.selectIndex);
            
            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
            CGPoint currPos = layer.position;
            if (layer.selectIndex==88) {
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path addArcWithCenter:center radius:_smallRadius-5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
                layer.path = path.CGPath;
            }else{
                double middleAngle = (layer.starAngle + layer.endAngle)/2.0;
                CGPoint newPos = CGPointMake(currPos.x + 10*cos(middleAngle), currPos.y + 10*sin(middleAngle));
                layer.position = newPos;
            }
            
        }else{
            //            NSLog(@"没有点到我，不关我的事");
            layer.position = CGPointMake(0, 0);
            layer.isSelected = NO;
            self.isSelected = layer.isSelected;
            if (layer.selectIndex==88) {
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path addArcWithCenter:center radius:_smallRadius-3 startAngle:0 endAngle:M_PI*2 clockwise:YES];
                layer.path = path.CGPath;
                self.clickBlock(layer.selectIndex);
            }
            
        }
    }
}

@end
