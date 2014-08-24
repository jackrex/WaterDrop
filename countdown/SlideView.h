//
//  SlideView.h
//  countdown
//
//  Created by JackRex on 4/5/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideView : UIView
{
    UIImageView *line;
    UIImageView *touchImage;
}

-(void)updateView:(CGPoint) pos;

@end
