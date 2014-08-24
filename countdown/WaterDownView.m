//
//  WaterDownView.m
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "WaterDownView.h"

@implementation WaterDownView

- (id)initWithFrame:(CGRect)frame
{

    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    

        
        links = [CADisplayLink displayLinkWithTarget:self selector:@selector(loop:)];
        
        [links addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
        UIColor *background = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"timer_clockdown.png"]];
        
        self.backgroundColor = background;
        
        waterDrop =  [[Water alloc]initWithPos:CGPointMake(160, 0)];
        [self addSubview:waterDrop];
    }
    return self;
}


-(void)loop :(CADisplayLink *) sender {

    if (!waterDrop.isPosVailed) {
        
        [waterDrop resetPos:CGPointMake(160, 0)];
        
    }
    
    [waterDrop update];
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
