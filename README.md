HWButton
========

HWButton is a wrapper of UIButton. 

It supports image of button rotation when receiving orientation changed notification.

How to Start
========

HWButton *button = [[HWButton alloc]initWithFrame:yourFrame];

button.orietationDetect = YES;  //Support Orientation

button.delegate = self;    //Recive Button ControlEvent

[button addControlEvent:UIControlEventTouchUpOutside];  //Add controlEvent

License
======

It is based on 'MIT' License.
