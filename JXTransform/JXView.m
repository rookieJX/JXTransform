//
//  JXView.m
//  JXTransform
//
//  Created by yuezuo on 16/5/6.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXView.h"

@interface JXView ()

/** 路径 */
@property (nonatomic,strong) UIBezierPath * path;

@end

@implementation JXView

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取当前手指触摸点
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    // 创建曲线
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    self.path = path;
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取当前手指触摸点
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.path addLineToPoint:point];
    // 重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建动画
    CAKeyframeAnimation * key = [CAKeyframeAnimation animation];
    
    key.keyPath = @"position";
    
    // 动画路径
    key.path = self.path.CGPath;
    
    key.duration = 5;
    
    // 重复次数
    key.repeatCount = MAXFLOAT;
    
    [[[self.subviews firstObject] layer] addAnimation:key forKey:nil];
}
@end
