//
//  ViewController.h
//  countdown
//
//  Created by JackRex on 4/3/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "Water.h"
#import "WaterUpView.h"
#import "WaterDownView.h"
#import "SlideView.h"
#import "GADBannerView.h"

@interface ViewController : UIViewController

{

    Water *waterDrop;
    
    CADisplayLink *links;

    int min;
    int sec;
    
    float waterWavePosY ;
    
    
    float touchYOffSet;
    
    UIImageView *water;
    UIImageView *waterWave;
    UIImageView *line;
    UIImageView *touchImage;
    
    
    UIImageView *bg;
    

    UILabel *hopeTimeLable;
    

    
    
    BOOL isSetTime;
    
    BOOL isTimeLableClick;
    BOOL isTimeLineClick;
    
    
    BOOL isShouldRaiseTimeBack;
    BOOL isShouldPushTimeDown;
    BOOL isOverHeight;
    BOOL isLowerHeight;
    
    BOOL isSlideEnable;
    
    
    BOOL isCountTimeMode;
    
    
    BOOL isPause;
    BOOL isStart;
    
    
    BOOL isShouldTurnLight;
    
    BOOL isSplashStart;
    BOOL isSplashFinish;
    
    
    AVAudioPlayer *player;
    AVAudioPlayer *finalPlayer;
    NSMutableArray *songs;
    
    
}

@property  GADBannerView * adBanner;
@property (strong, nonatomic) IBOutlet UILabel *timeLable;
@property (strong, nonatomic) IBOutlet UILabel *hintLable;


//- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender;

@end
