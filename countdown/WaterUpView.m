//
//  WaterUpView.m
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "WaterUpView.h"

@implementation WaterUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        wave = [[WaterWave alloc]initWithFrame:CGRectMake(0, 172, 960, 28)];
        timeView = [[TimeView alloc]initWithFrame:CGRectMake(0, 72, 320, 100)];
        water = [[UIImageView alloc]initWithFrame:CGRectMake(0, 120, 320, 100)];
        UIColor *waterground = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"timer_water.png"]];
        water.backgroundColor = waterground;
        
       [self addSubview:water];
       [self addSubview:wave];
       bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 240)];
       UIColor *background = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"timer_clockup.png"]];
        bg.backgroundColor = background;
        [self addSubview:bg];
        [self addSubview:timeView];
 
    }
    return self;
}

@end
