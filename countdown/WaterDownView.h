//
//  WaterDownView.h
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Water.h"
#import <QuartzCore/QuartzCore.h>
@interface WaterDownView : UIView
{
    Water *waterDrop;
    CADisplayLink *links;
}


@end
