//
//  Water.m
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "Water.h"

@implementation Water

-(Water *)initWithPos:(CGPoint )pos{
    if (self = [self init]) {
        accelleration = 0.0;
        direction = CGPointMake(1.0, 1.0);
        speed = CGPointMake(2.0, 2.0);
        waterdrop = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timer_water"]];
        
        waterdrop.clipsToBounds = YES;
        waterdrop.layer.cornerRadius = 10;
        
        [self addSubview:waterdrop];
        self.frame = CGRectMake(pos.x, pos.y, waterdrop.frame.size.width, waterdrop.frame.size.height);
        [self addSubview:waterdrop];
    }
    return self;
}

-(void)update{
    self.center = [self nextPosition];
}

-(void)resetPos:(CGPoint)pos{
      self.frame = CGRectMake(pos.x, pos.y, waterdrop.frame.size.width, waterdrop.frame.size.height);
}

- (CGPoint) nextPosition {
    return CGPointMake(self.center.x, self.center.y+(speed.y*direction.y));
}

-(BOOL)isPosVailed{
    if (self.center.y > 640) {
        return NO;
    }
    return YES;
}

@end
