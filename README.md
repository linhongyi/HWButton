HWButton
========

HWButton is a wrapper of UIButton. 

It supports image of button rotation when receiving orientation changed notification.

How to Start
========

//Initialization
HWButton *button = [[HWButton alloc]initWithFrame:yourFrame];

//Support Orientation
button.orietationDetect = YES;

//Recive Button ControlEvent
button.delegate = self;

//Add controlEvent
[button addControlEvent:UIControlEventTouchUpOutside];


License
======

It is based on 'MIT' License.
