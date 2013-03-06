//
//  ViewController.h
//  Drawing
//
//  Created by i Tech Coders Pvt Ltd. on 06/03/13.
//  Copyright (c) 2013 i Tech Coders Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    CGPoint point;
    UIImageView *image;
    BOOL mouseSwiped;
    int mouseMoved;
}
@property (strong, nonatomic)IBOutlet UIImageView *image;
@end
