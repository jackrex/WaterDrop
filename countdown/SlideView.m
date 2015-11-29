//
//  SlideView.m
//  countdown
//
//  Created by JackRex on 4/5/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "SlideView.h"

@implementation SlideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 960, 1)];
        line.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timer_item_repeatline.png"]];
        
        touchImage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 198, 50, 50)];
        touchImage.image = [UIImage imageNamed:@"touch.png"];
        [self addSubview:line];
        [self addSubview:touchImage];
        
    }
    return self;
}

-(void)updateView:(CGPoint) pos{
    line.center = pos;
    touchImage.center = pos;
}

@end
