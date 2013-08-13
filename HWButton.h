//
//  HWButton.h
//  IOS7ComponentExample
//
//  Created by PPUser on 13/8/12.
//  Copyright (c) 2013年 Howard. All rights reserved.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////

#define AnimationDuration 0.3
#define OrientationDidChangeNotification @"orientationDidChangeNotification"

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - HWButtonDelegate

@class HWButton;

@protocol HWButtonDelegate <NSObject>

@required
 - (void)hwButton:(HWButton *)hwButton controlEvents:(UIControlEvents)controlEvents;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - HWButton

@interface HWButton : UIButton

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Property

@property (nonatomic,assign) id<HWButtonDelegate> delegate;
@property (nonatomic,assign) BOOL orientationDetect;

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Instance Method

//==================================================
//
//==================================================
- (BOOL)addControlEvents:(UIControlEvents)controlEvents;


//==================================================
//
//==================================================
- (BOOL)removeControlEvents:(UIControlEvents)controlEvents;

@end
