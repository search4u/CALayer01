//
//  ViewController.m
//  CALayer01
//
//  Created by bottle on 15-4-28.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic,weak) CALayer *myLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testAnimation];
}

- (void)testView {
    //圆角
    self.blueView.layer.cornerRadius = 10;
    //self.blueView.layer.masksToBounds = YES;
    self.blueView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.blueView.layer.shadowOffset = CGSizeMake(10, 10);
    self.blueView.layer.shadowOpacity = 1;
    //边框
    self.blueView.layer.borderWidth = 2;
    self.blueView.layer.borderColor = [UIColor greenColor].CGColor;
}

- (void)testImageView {
    self.iconView.layer.cornerRadius = 10;
    //self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.iconView.layer.shadowOffset = CGSizeMake(10, 10);
    self.iconView.layer.shadowOpacity = 0.5;
}

- (void)testImageView2 {
//    self.iconView.layer.position = CGPointMake(100, 100);
//    self.iconView.layer.anchorPoint = CGPointMake(0, 0);
    //layer
    //旋转
    self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    //平移
    self.iconView.layer.transform = CATransform3DMakeTranslation(100, 100, 20);
    //缩放
    self.iconView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
    //quartz2d
    //旋转
    self.iconView.transform = CGAffineTransformMakeRotation(M_PI_4);
    //平移
    self.iconView.transform = CGAffineTransformMakeTranslation(100, 100);
    //缩放
    self.iconView.transform = CGAffineTransformMakeScale(0.5, 0.5);
}

- (void)testImageView3 {
    //kvc
    //旋转
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
    NSValue *value = [NSValue valueWithCATransform3D:transform];
    [self.iconView.layer setValue:value forKeyPath:@"transform"];
    //平移
    //[self.iconView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 100, 0)] forKeyPath:@"transform"];
    [self.iconView.layer setValue:@(M_PI_4) forKeyPath:@"transform.rotation"];
    //缩放
    [self.iconView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 0)] forKeyPath:@"transform"];
}

/**
 *  自定义图层
 */
- (void)customLayer {
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointZero;
    layer.position = CGPointZero;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.borderColor = [UIColor greenColor].CGColor;
    layer.borderWidth = 10;
    layer.contents = (id)[UIImage imageNamed:@"lufy"].CGImage;
    
    [self.view.layer addSublayer:layer];
}
/**
 *  隐式动画
 */
- (void)testAnimation {
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.contents = (id)[UIImage imageNamed:@"lufy"].CGImage;
    [self.view.layer addSublayer:layer];
    self.myLayer = layer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //可动画属性
    [CATransaction begin];
    //关闭动画
    [CATransaction setDisableActions:YES];
    self.myLayer.position = CGPointMake(200, 200);
    self.myLayer.opacity = 0.1;
    [CATransaction commit];
}

@end
