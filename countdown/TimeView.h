//
//  TimeView.h
//  countdown
//
//  Created by JackRex on 4/4/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeView : UIView
{
    UILabel *timeLable;
    UILabel *dropLabel;
    
    NSInteger *min;
    NSInteger *sec;
    
}
@end
