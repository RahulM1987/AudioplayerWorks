//
//  CircularSlide.h
//  mp3player
//
//  Created by Rahul on 11/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularSlide : UIView

-(id)initWithMinValue:(float)minValue maxValue:(float)maxValue initialValue:(float)initialValue;
-(float)value;


@end
