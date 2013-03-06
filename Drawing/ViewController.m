//
//  ViewController.m
//  Drawing
//
//  Created by i Tech Coders Pvt Ltd. on 06/03/13.
//  Copyright (c) 2013 i Tech Coders Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize image;
- (void)viewDidLoad
{
    [super viewDidLoad];
    mouseMoved = 0;

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark – View lifecycle

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        image.image = nil;
        return;
    }
    point = [touch locationInView:self.view];
    point.y -= 10;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    currentPoint.y -= 10;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [image.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width,
                                       self.view.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), point.x, point.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    image.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    point = currentPoint;
    mouseMoved++;
    if (mouseMoved == 10) {
        mouseMoved = 0;
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        image.image = nil;
        return;
    }
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [image.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width,
                                           self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), point.x, point.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), point.x, point.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        image.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}



@end
