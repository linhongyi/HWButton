//
//  HWButton.m
//  IOS7ComponentExample
//
//  Created by PPUser on 13/8/12.
//  Copyright (c) 2013年 Howard. All rights reserved.
//

#import "HWButton.h"
#import "HWButton+Rotation.h"

@interface HWButton()
{
    @private
     id<HWButtonDelegate> delegate_;
     BOOL                 orientationDetect_;
}

- (void)orientationDidChangeNotification:(NSNotification *)notification;

- (void)addTouchDownEvent;
- (void)addTouchDownRepeatEvent;
- (void)addTouchDragInsideEvent;
- (void)addTouchDragOutsideEvent;
- (void)addTouchDragEnterEvent;
- (void)addTouchDragExitEvent;
- (void)addTouchUpInsideEvent;
- (void)addTouchUpOutsideEvent;
- (void)addTouchCancelEvent;
- (void)addValueChangedEvent;
- (void)addEditingDidBeginEvent;
- (void)addEditingChangedEvent;
- (void)addEditingDidEndEvent;
- (void)addEditingDidEndOnExitEvent;

- (void)buttonTouchDown;
- (void)buttonTouchDownRepeat;
- (void)buttonTouchDragInside;
- (void)buttonTouchDragOutside;
- (void)buttonTouchDragEnter;
- (void)buttonTouchDragExit;
- (void)buttonTouchUpInside;
- (void)buttonTouchUpOutside;
- (void)buttonTouchCancel;
- (void)buttonValueChanged;
- (void)buttonEditingDidBegin;
- (void)buttonEditingChanged;
- (void)buttonEditingDidEnd;
- (void)buttonEditingDidEndOnExit;

- (void)removeTouchDownEvent;
- (void)removeTouchDownRepeatEvent;
- (void)removeTouchDragInsideEvent;
- (void)removeTouchDragOutsideEvent;
- (void)removeTouchDragEnterEvent;
- (void)removeTouchDragExitEvent;
- (void)removeTouchUpInsideEvent;
- (void)removeTouchUpOutsideEvent;
- (void)removeTouchCancelEvent;
- (void)removeValueChangedEvent;
- (void)removeEditingDidBeginEvent;
- (void)removeEditingChangedEvent;
- (void)removeEditingDidEndEvent;
- (void)removeEditingDidEndOnExitEvent;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - HWButton

@implementation HWButton

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Synthesize

@synthesize delegate          = delegate_;
@synthesize orientationDetect = orientationDetect_;

////////////////////////////////////////////////////////////////////////////////////////////////////

//==================================================
//
//==================================================
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    return self;
}

//==================================================
//
//==================================================
- (void)dealloc
{
    [self setOrientationDetect:NO];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [super dealloc];
}

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Property Method

//==================================================
//
//==================================================
- (void)setOrientationDetect:(BOOL)orientationDetect
{
    orientationDetect_ = orientationDetect;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if(orientationDetect_==YES)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(orientationDidChangeNotification:)
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Orientation Change Notifcation Method

//==================================================
//
//==================================================
- (void)orientationDidChangeNotification:(NSNotification *)notification
{
    static UIDeviceOrientation preDeviceOrientation = UIDeviceOrientationUnknown;

    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice]orientation];
    
    if(deviceOrientation==UIDeviceOrientationFaceDown || deviceOrientation==UIDeviceOrientationFaceUp || deviceOrientation==UIDeviceOrientationUnknown)
    {
        
    }
    else
    {
        if(preDeviceOrientation!=deviceOrientation)
        {
            preDeviceOrientation = deviceOrientation;
            
            switch (preDeviceOrientation)
            {
                case UIDeviceOrientationFaceDown:
                case UIDeviceOrientationFaceUp:
                case UIDeviceOrientationUnknown:
                {
                    break;
                }
                case UIDeviceOrientationLandscapeLeft:
                {
                    [self viewRotationByInterfaceOrientation:UIInterfaceOrientationLandscapeRight animated:YES duration:AnimationDuration];
                    break;
                }
                case UIDeviceOrientationLandscapeRight:
                {
                    [self viewRotationByInterfaceOrientation:UIInterfaceOrientationLandscapeLeft animated:YES duration:AnimationDuration];
                    break;
                }
                case UIDeviceOrientationPortraitUpsideDown:
                {
                    [self viewRotationByInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown animated:YES duration:AnimationDuration];
                    break;
                }
                case UIDeviceOrientationPortrait:
                default:
                {
                    [self viewRotationByInterfaceOrientation:UIInterfaceOrientationPortrait animated:YES duration:AnimationDuration];
                    break;
                }
            }
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Private Method

//==================================================
//
//==================================================
- (void)addTouchDownEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDown)
   forControlEvents:UIControlEventTouchDown];
}


//==================================================
//
//==================================================
- (void)addTouchDownRepeatEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDownRepeat)
   forControlEvents:UIControlEventTouchDownRepeat];
}

//==================================================
//
//==================================================
- (void)addTouchDragInsideEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDragInside)
   forControlEvents:UIControlEventTouchDragInside];
}


//==================================================
//
//==================================================
- (void)addTouchDragOutsideEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDragOutside)
   forControlEvents:UIControlEventTouchDragOutside];
}


//==================================================
//
//==================================================
- (void)addTouchDragEnterEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDragEnter)
   forControlEvents:UIControlEventTouchDragEnter];
}


//==================================================
//
//==================================================
- (void)addTouchDragExitEvent
{
    [self addTarget:self
             action:@selector(buttonTouchDragExit)
   forControlEvents:UIControlEventTouchDragExit];
}


//==================================================
//
//==================================================
- (void)addTouchUpInsideEvent
{
    [self addTarget:self
             action:@selector(buttonTouchUpInside)
   forControlEvents:UIControlEventTouchUpInside];
}


//==================================================
//
//==================================================
- (void)addTouchUpOutsideEvent
{
    [self addTarget:self
             action:@selector(buttonTouchUpOutside)
   forControlEvents:UIControlEventTouchUpOutside];
}


//==================================================
//
//==================================================
- (void)addTouchCancelEvent
{
    [self addTarget:self
             action:@selector(buttonTouchCancel)
   forControlEvents:UIControlEventTouchCancel];
}


//==================================================
//
//==================================================
- (void)addValueChangedEvent
{
    [self addTarget:self
             action:@selector(buttonValueChanged)
   forControlEvents:UIControlEventValueChanged];
}


//==================================================
//
//==================================================
- (void)addEditingDidBeginEvent
{
    [self addTarget:self
             action:@selector(buttonEditingDidBegin)
   forControlEvents:UIControlEventEditingDidBegin];
}


//==================================================
//
//==================================================
- (void)addEditingChangedEvent
{
    [self addTarget:self
             action:@selector(buttonEditingChanged)
   forControlEvents:UIControlEventEditingChanged];
}


//==================================================
//
//==================================================
- (void)addEditingDidEndEvent
{
    [self addTarget:self
             action:@selector(buttonEditingDidEnd)
   forControlEvents:UIControlEventEditingDidEnd];
}


//==================================================
//
//==================================================
- (void)addEditingDidEndOnExitEvent
{
    [self addTarget:self
             action:@selector(buttonEditingDidEndOnExit)
   forControlEvents:UIControlEventEditingDidEndOnExit];
}


//==================================================
//
//==================================================
- (void)buttonTouchDown
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDown];
}


//==================================================
//
//==================================================
- (void)buttonTouchDownRepeat
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDownRepeat];
}


//==================================================
//
//==================================================
- (void)buttonTouchDragInside
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDragInside];
}


//==================================================
//
//==================================================
- (void)buttonTouchDragOutside
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDragOutside];
}


//==================================================
//
//==================================================
- (void)buttonTouchDragEnter
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDragEnter];
}


//==================================================
//
//==================================================
- (void)buttonTouchDragExit
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchDragExit];
}


//==================================================
//
//==================================================
- (void)buttonTouchUpInside
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchUpInside];
}


//==================================================
//
//==================================================
- (void)buttonTouchUpOutside
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchUpOutside];
}


//==================================================
//
//==================================================
- (void)buttonTouchCancel
{
    [self.delegate hwButton:self controlEvents:UIControlEventTouchCancel];
}


//==================================================
//
//==================================================
- (void)buttonValueChanged
{
    [self.delegate hwButton:self controlEvents:UIControlEventValueChanged];
}


//==================================================
//
//==================================================
- (void)buttonEditingDidBegin
{
    [self.delegate hwButton:self controlEvents:UIControlEventEditingDidBegin];
}


//==================================================
//
//==================================================
- (void)buttonEditingChanged
{
    [self.delegate hwButton:self controlEvents:UIControlEventEditingChanged];
}


//==================================================
//
//==================================================
- (void)buttonEditingDidEnd
{
    [self.delegate hwButton:self controlEvents:UIControlEventEditingDidEnd];
}


//==================================================
//
//==================================================
- (void)buttonEditingDidEndOnExit
{
    [self.delegate hwButton:self controlEvents:UIControlEventEditingDidEndOnExit];
}


//==================================================
//
//==================================================
- (void)removeTouchDownEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDown)
      forControlEvents:UIControlEventTouchDown];
}


//==================================================
//
//==================================================
- (void)removeTouchDownRepeatEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDownRepeat)
      forControlEvents:UIControlEventTouchDownRepeat];
}


//==================================================
//
//==================================================
- (void)removeTouchDragInsideEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDragInside)
      forControlEvents:UIControlEventTouchDragInside];
}


//==================================================
//
//==================================================
- (void)removeTouchDragOutsideEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDragOutside)
      forControlEvents:UIControlEventTouchDragOutside];
}


//==================================================
//
//==================================================
- (void)removeTouchDragEnterEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDragEnter)
      forControlEvents:UIControlEventTouchDragEnter];
}


//==================================================
//
//==================================================
- (void)removeTouchDragExitEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchDragExit)
      forControlEvents:UIControlEventTouchDragExit];
}


//==================================================
//
//==================================================
- (void)removeTouchUpInsideEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchUpInside)
      forControlEvents:UIControlEventTouchUpInside];
}


//==================================================
//
//==================================================
- (void)removeTouchUpOutsideEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchUpOutside)
      forControlEvents:UIControlEventTouchUpOutside];
}


//==================================================
//
//==================================================
- (void)removeTouchCancelEvent
{
    [self removeTarget:self
                action:@selector(buttonTouchCancel)
      forControlEvents:UIControlEventTouchCancel];
}


//==================================================
//
//==================================================
- (void)removeValueChangedEvent
{
    [self removeTarget:self
                action:@selector(buttonValueChanged)
      forControlEvents:UIControlEventValueChanged];
}


//==================================================
//
//==================================================
- (void)removeEditingDidBeginEvent
{
    [self removeTarget:self
                action:@selector(buttonEditingDidBegin)
      forControlEvents:UIControlEventEditingDidBegin];
}


//==================================================
//
//==================================================
- (void)removeEditingChangedEvent
{
    [self removeTarget:self
                action:@selector(buttonEditingChanged)
      forControlEvents:UIControlEventEditingChanged];
}


//==================================================
//
//==================================================
- (void)removeEditingDidEndEvent
{
    [self removeTarget:self
                action:@selector(buttonEditingDidEnd)
      forControlEvents:UIControlEventEditingDidEnd];
}


//==================================================
//
//==================================================
- (void)removeEditingDidEndOnExitEvent
{
    [self removeTarget:self
                action:@selector(buttonEditingDidEndOnExit)
      forControlEvents:UIControlEventEditingDidEndOnExit];
}

////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Instance Method

//==================================================
//
//==================================================
- (BOOL)addControlEvents:(UIControlEvents)controlEvents
{
    UIControlEvents result = 0;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDown)==TRUE)
    {
        [self addTouchDownEvent];
        
        result += UIControlEventTouchDown;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDownRepeat)==TRUE)
    {
        [self addTouchDownRepeatEvent];
        
        result += UIControlEventTouchDownRepeat;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragInside)==TRUE)
    {
        [self addTouchDragInsideEvent];
        
        result += UIControlEventTouchDragInside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragOutside)==TRUE)
    {
        [self addTouchDragOutsideEvent];
        
        result += UIControlEventTouchDragOutside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragEnter)==TRUE)
    {
        [self addTouchDragEnterEvent];
        
        result += UIControlEventTouchDragEnter;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragExit)==TRUE)
    {
        [self addTouchDragExitEvent];
        
        result += UIControlEventTouchDragExit;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchUpInside)==TRUE)
    {
        [self addTouchUpInsideEvent];
        
        result += UIControlEventTouchUpInside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchUpOutside)==TRUE)
    {
        [self addTouchUpOutsideEvent];
        
        result += UIControlEventTouchUpOutside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchCancel)==TRUE)
    {
        [self addTouchCancelEvent];
        
        result += UIControlEventTouchCancel;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventValueChanged)==TRUE)
    {
        [self addValueChangedEvent];
        
        result += UIControlEventValueChanged;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidBegin)==TRUE)
    {
        [self addEditingDidBeginEvent];
        
        result += UIControlEventEditingDidBegin;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingChanged)==TRUE)
    {
        [self addEditingChangedEvent];
        
        result += UIControlEventEditingChanged;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidEnd)==TRUE)
    {
        [self addEditingDidEndEvent];
        
        result += UIControlEventEditingDidEnd;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidEndOnExit)==TRUE)
    {
        [self addEditingDidEndOnExitEvent];
        
        result += UIControlEventEditingDidEndOnExit;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    if(result==controlEvents)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//==================================================
//
//==================================================
- (BOOL)removeControlEvents:(UIControlEvents)controlEvents
{
    UIControlEvents result = 0;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDown)==TRUE)
    {
        [self removeTouchDownEvent];
        
        result += UIControlEventTouchDown;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDownRepeat)==TRUE)
    {
        [self removeTouchDownRepeatEvent];
        
        result += UIControlEventTouchDownRepeat;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragInside)==TRUE)
    {
        [self removeTouchDragInsideEvent];
        
        result += UIControlEventTouchDragInside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragOutside)==TRUE)
    {
        [self removeTouchDragOutsideEvent];
        
        result += UIControlEventTouchDragOutside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragEnter)==TRUE)
    {
        [self removeTouchDragEnterEvent];
        
        result += UIControlEventTouchDragEnter;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchDragExit)==TRUE)
    {
        [self removeTouchDragExitEvent];
        
        result += UIControlEventTouchDragExit;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchUpInside)==TRUE)
    {
        [self removeTouchUpInsideEvent];
        
        result += UIControlEventTouchUpInside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchUpOutside)==TRUE)
    {
        [self removeTouchUpOutsideEvent];
        
        result += UIControlEventTouchUpOutside;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventTouchCancel)==TRUE)
    {
        [self removeTouchCancelEvent];
        
        result += UIControlEventTouchCancel;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventValueChanged)==TRUE)
    {
        [self removeValueChangedEvent];
        
        result += UIControlEventValueChanged;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidBegin)==TRUE)
    {
        [self removeEditingDidBeginEvent];
        
        result += UIControlEventEditingDidBegin;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingChanged)==TRUE)
    {
        [self removeEditingChangedEvent];
        
        result += UIControlEventEditingChanged;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidEnd)==TRUE)
    {
        [self removeEditingDidEndEvent];
        
        result += UIControlEventEditingDidEnd;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if((controlEvents & UIControlEventEditingDidEndOnExit)==TRUE)
    {
        [self removeEditingDidEndOnExitEvent];
        
        result += UIControlEventEditingDidEndOnExit;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    if(result==controlEvents)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
