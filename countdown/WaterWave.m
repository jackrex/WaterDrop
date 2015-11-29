//
//  WaterWave.m
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "WaterWave.h"

@implementation WaterWave

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initWaves];
        CADisplayLink  *links = [CADisplayLink displayLinkWithTarget:self selector:@selector(loop:)];
        [links addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

-(void)loop :(CADisplayLink *) sender {
    [self update];
}

-(void)initWaves{
    waterWave1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timer_wave1.png"]];
    waterWave2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timer_wave2.png"]];
    waterWave1.frame = CGRectMake(-140, 172, 960, 28);
    [self addSubview:waterWave1];
}

-(void)update{
    if (self.center.x > 480) {
        [self resetPos:CGPointMake(-480, 0)];
        return;
    }
    self.center = [self nextPosition];
}

-(void)resetPos:(CGPoint)pos{
    self.frame = CGRectMake(pos.x, pos.y, waterWave1.frame.size.width, waterWave1.frame.size.height);
}

- (CGPoint) nextPosition {
    return CGPointMake(self.center.x+2, self.center.y);
}

@end
