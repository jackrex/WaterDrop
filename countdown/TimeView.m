//
//  TimeView.m
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLable];
        
        timeLable.text = @"12:04";
        dropLabel.text = @"滑动暂停";
        
       NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(mytimerAction) userInfo:nil repeats:YES];
        
        [runloop addTimer:timer forMode:NSRunLoopCommonModes];
        [runloop addTimer:timer forMode:UITrackingRunLoopMode];
        
        [self addSubview:timeLable];
        [self addSubview:dropLabel];
        
    }
    return self;
}


-(void)initLable{
    
    timeLable = [[UILabel alloc]initWithFrame:CGRectMake(160, 100, 320, 50)];
    
    dropLabel  = [[UILabel alloc]initWithFrame:CGRectMake(160, 50, 320, 50)];
    

}







-(void)setTime{

   NSArray *times =  [timeLable.text componentsSeparatedByString:@":"];
   
    NSLog(@"min is %@, sec is %@", [times objectAtIndex:0], [times objectAtIndex:1]);
    
    
    
    
    
    
}




@end
