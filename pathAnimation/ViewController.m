//
//  ViewController.m
//  pathAnimation
//
//  Created by Rajendrasinh Parmar on 28/04/16.
//  Copyright © 2016 Rajendrasinh Parmar. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#import "ViewController.h"

@implementation ViewController

@synthesize animation = _animation;
@synthesize path = _path;

-(void) DrawingSetup
{
    if (self.path != nil) {
        [self.path removeFromSuperlayer];
        self.path = nil;
    }
    
    CGRect pathRect = CGRectInset(self.animation.bounds, 100.0f, 100.0f);
    CGPoint bottomLeft 	= CGPointMake(CGRectGetMinX(pathRect), CGRectGetMinY(pathRect));
    CGPoint topLeft		= CGPointMake(CGRectGetMinX(pathRect), CGRectGetMinY(pathRect) + CGRectGetHeight(pathRect) * 2.0f/3.0f);
    CGPoint bottomRight = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMinY(pathRect));
    CGPoint topRight	= CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMinY(pathRect) + CGRectGetHeight(pathRect) * 2.0f/3.0f);
    CGPoint roofTip		= CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:roofTip];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:topRight];
    [path addLineToPoint:bottomLeft];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.animation.bounds;
    pathLayer.bounds = pathRect;
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 10.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.animation addSublayer:pathLayer];
    
    self.path = pathLayer;
    
}

-(void)animate
{
    [self.path removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 10.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.path addAnimation:pathAnimation forKey:@"strokeEnd"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animation = [CALayer layer];
    self.animation.frame = CGRectMake(20.0f, 64.0f, CGRectGetWidth(self.view.layer.bounds) - 40.0f, CGRectGetHeight(self.view.layer.bounds)-84.0f);
    
    [self.view.layer addSublayer:self.animation];
    
    [self DrawingSetup];
    [self animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
