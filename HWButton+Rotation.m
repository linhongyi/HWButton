//
//  HWButton+Rotation.m
//
//  Created by Howard on 13/8/12.
//  Copyright (c) 2013年 Howard. All rights reserved.
//

#import "HWButton+Rotation.h"

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - HWButton (Rotation)

@implementation HWButton (Rotation)

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Instance Method

//==================================================
//
//==================================================
- (void)viewRotationByInterfaceOrientation:(UIInterfaceOrientation)orientation animated:(BOOL)animated duration:(NSTimeInterval)duration
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    switch (orientation)
    {
        case UIInterfaceOrientationLandscapeLeft:
        {
            transform = CGAffineTransformRotate(transform,M_PI_2);
            break;
        }
        case UIInterfaceOrientationLandscapeRight:
        {
            transform = CGAffineTransformRotate(transform,-M_PI_2);
            break;
        }
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            transform = CGAffineTransformRotate(transform,M_PI_2);

            break;
        }
        case UIInterfaceOrientationPortrait:
        default:
        {
            break;
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if(animated==YES)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        
        [self.imageView setTransform:transform];
        
        [UIView commitAnimations];

    }
    else
    {
        [self.imageView setTransform:transform];
    }
}

@end
