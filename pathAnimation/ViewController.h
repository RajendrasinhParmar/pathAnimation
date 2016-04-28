//
//  ViewController.h
//  pathAnimation
//
//  Created by Rajendrasinh Parmar on 28/04/16.
//  Copyright © 2016 Rajendrasinh Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    CALayer *_animation;
    CAShapeLayer *_path;
}

@property (nonatomic, retain) CALayer *animation;
@property (nonatomic, retain) CAShapeLayer *path;


@end

