//
//  Water.h
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LENGTH 400
@interface Water : UIView
{
    UIImageView *waterdrop;
    CGPoint speed;
    BOOL posVailed;
    CGFloat accelleration;
    CGPoint direction;

}

-(Water *)initWithPos:(CGPoint )pos;
-(void) update;
-(void) resetPos:(CGPoint)pos;
-(BOOL) isPosVailed;
@end
