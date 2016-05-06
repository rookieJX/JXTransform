//
//  ViewController.m
//  JXTransform
//
//  Created by yuezuo on 16/5/6.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"

#define angle(a) ((a)/180.0 * M_PI)
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueView.layer.cornerRadius = 5;
    self.blueView.clipsToBounds = YES;
}



- (void)setupBase {
    // 触摸点
//    UITouch * touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
    
    // 基本动画
    CABasicAnimation * animation = [CABasicAnimation animation];
    
    // 设置哪个属性需要修改动画
    animation.keyPath = @"position";
    
    // 设置值
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    
    // 保存动画执行完成后的状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    // 添加动画
    [self.blueView.layer addAnimation:animation forKey:nil];
}

- (void)setupKey {
    // 添加核心动画
    CAKeyframeAnimation * key = [CAKeyframeAnimation animation];
    
    // 设置需要修改的属性
    key.keyPath = @"transform.rotation";
    
    // 设置修改
    key.values = @[@(angle(0)),@(angle(5)),@(angle(10)),@(angle(15)),@(angle(10)),@(angle(5)),@(angle(0)),@(angle(-5)),@(angle(-10)),@(angle(-15)),@(angle(-10)),@(angle(-5)),@(angle(0))];

    // 重复次数
    key.repeatCount = MAXFLOAT;
    
    // 添加到控件
    [self.blueView.layer addAnimation:key forKey:nil];
    

}

- (void)setupKeyPath {
    // 添加核心动画
    CAKeyframeAnimation * key = [CAKeyframeAnimation animation];
    
    // 设置需要修改的属性
    key.keyPath = @"position";
    
    // 设置修改
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, self.view.bounds.size.width - 100, self.view.bounds.size.height - 100)];
    
    // 转化路径
    key.path = path.CGPath;
    
    key.duration = 4;
    
    // 重复次数
    key.repeatCount = MAXFLOAT;
    
    // 添加到控件
    [self.blueView.layer addAnimation:key forKey:nil];

}
@end
