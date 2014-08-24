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








#pragma mark - touches

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self];
    
    NSLog(@"location %f, %f",location.x,location.y);
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
[self touchesBegan:touches withEvent:event];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{


}


# pragma mark -draw
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
