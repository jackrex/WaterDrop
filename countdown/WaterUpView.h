//
//  WaterUpView.h
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WaterWave.h"
#import "TimeView.h"
@interface WaterUpView : UIView
{

    UIImageView *water;
    TimeView *timeView;
    WaterWave *wave;
    UIView *bg;

}
@end
