//
//  ViewController.m
//  countdown
//
//  Created by JackRex on 4/3/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "ViewController.h"
#import "SettingTableViewController.h"
@interface ViewController ()<UIAlertViewDelegate>{

}
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@end

@implementation ViewController
@synthesize timeLable;
@synthesize hintLable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    waterWavePosY = 186;
    isSetTime = NO;
    isTimeLableClick = NO;
    hintLable.hidden =YES;
    isShouldRaiseTimeBack = NO;
    isShouldPushTimeDown = NO;
    isTimeLableClick = NO;
    isSlideEnable = NO;
    isCountTimeMode = NO;
    isStart = NO;
    isShouldTurnLight = NO;
    isSplashFinish = YES;
    isSplashStart = NO;
    isOverHeight = NO;
    isPause = NO;
    
    touchYOffSet = 0.0f;
 
    timeLable.font = [UIFont fontWithName:@"MyriadSetPro-Ultralight" size:72];
    hintLable.font =[UIFont fontWithName:@"MyriadSetPro-Ultralight" size:18];
    
    songs = [[NSMutableArray alloc]init];
    for (NSInteger i = 4; i<10; i++) {
        [songs addObject:[NSString stringWithFormat:@"waterdrop_%d",i]];
    }
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(mytimerAction) userInfo:nil repeats:YES];
    
    NSTimer *timer2 = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(turnLight) userInfo:nil repeats:YES];

    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];
    
    [runloop addTimer:timer2 forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer2 forMode:UITrackingRunLoopMode];

    waterWave = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timer_wave1.png"]];
    waterWave.frame = CGRectMake(-320, 186, 640, 14);
    
    links = [CADisplayLink displayLinkWithTarget:self selector:@selector(loop:)];
    
    [links addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    

    hopeTimeLable =  [[UILabel alloc]initWithFrame:CGRectMake(100, 190, 100, 29)];
    hopeTimeLable.font =[UIFont fontWithName:@"MyriadSetPro-Ultralight" size:32];
    hopeTimeLable.text = @"00:00";
    hopeTimeLable.textColor = [UIColor whiteColor];
    
    
    line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 960, 1)];
    line.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timer_item_repeatline.png"]];
    
    touchImage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 175, 50, 50)];
    
    bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, 320, 640)];
  
    bg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xxx.png"]];
    
    touchImage.image = [UIImage imageNamed:@"touch.png"];
    
    waterDrop =  [[Water alloc]initWithPos:CGPointMake(self.view.frame.size.width/2 -10, 348)];
    
    hopeTimeLable.hidden = YES;
    line.hidden = YES;
    touchImage.hidden = YES;
    waterDrop.hidden = YES;
    
    water = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 320, 640)];
    
    UIColor *waterground = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"timer_water.png"]];
    
    water.backgroundColor = waterground;
    
    [self.view addSubview:water];
    [self.view sendSubviewToBack:water];


    [self.view addSubview:waterDrop];
    [self.view addSubview:waterWave];
    [self.view sendSubviewToBack:waterWave];
    [self.view addSubview:line];
    [self.view addSubview:touchImage];
    [self.view addSubview:hopeTimeLable];
    [self.view addSubview:bg];
    [self.view sendSubviewToBack:bg];

}

#pragma mark -infinate loop
-(void)loop :(CADisplayLink *) sender {
    [self updateWaterWave];
    if (isStart) {
        timeLable.alpha = 1.0;
          [waterDrop update];
    }else{
        waterDrop.hidden = YES;
        if (isShouldTurnLight) {
            timeLable.alpha =  timeLable.alpha - 0.01;
            if (timeLable.alpha <= 0.4) {
                timeLable.alpha = 0.4;
            }
        }else{
            timeLable.alpha = timeLable.alpha + 0.01;
            if (timeLable.alpha >= 1.0) {
                timeLable.alpha = 1.0;
            }
        }
        
        if (timeLable.alpha <= 0.3) {
            timeLable.alpha =  timeLable.alpha + 0.1;
        }
    }

    if (isShouldRaiseTimeBack) {
        [self raiseTimeBackPos];
        if (timeLable.center.y < 80) {
            isShouldRaiseTimeBack = NO;
            isShouldPushTimeDown = YES;
        }
    }
    
    if (isShouldPushTimeDown) {
        [self pushTimeDown];

    }

    //拉取时候的暂停
    if (isPause) {
        waterDrop.hidden = YES;
        return;
    }else {
        if (timeLable.center.y >= 120 ) {
            isShouldRaiseTimeBack = YES;
        }else{
            isShouldRaiseTimeBack = NO;
        }
    }
    
    if (!waterDrop.isPosVailed) {
        if (!isStart) {
            return;
        }
        [waterDrop resetPos:CGPointMake(self.view.frame.size.width/2-10, 348)];
        [self initPlayerAndPlay:[songs objectAtIndex:arc4random()%5]];
        
    }

}

-(void)raiseTimeBackPos{
    float speed = 15;
    float y = timeLable.center.y - (speed++)  ;
    timeLable.center = CGPointMake(timeLable.center.x
                                   , y) ;
    hintLable.center = CGPointMake(timeLable.center.x
                                   , y - 40);

}

-(void)pushTimeDown{
    float speed = 15;
    float y = timeLable.center.y + (speed++)  ;
    timeLable.center = CGPointMake(timeLable.center.x
                                   , y) ;
    hintLable.center = CGPointMake(timeLable.center.x
                                   , y - 40);
    if (timeLable.center.y >= 120) {
        isShouldPushTimeDown = NO;
        isShouldRaiseTimeBack = NO;
    }
    isPause = NO;
}

#pragma mark -updateTime
-(void)mytimerAction{
    if (isPause) {
        return;
    }
    
    if (isStart) {
        if (isSplashFinish) {
            [self setTime];
        }
    }
}

-(void)turnLight{
    if (!isStart) {
        isShouldTurnLight = !isShouldTurnLight;
    }
}

-(void)splash{
    [self performSelector:@selector(splashfinish) withObject:nil afterDelay:1];
    timeLable.alpha = 0.2;
    [self performSelector:@selector(delay) withObject:nil afterDelay:0.3];
}

-(void)delay{
    timeLable.alpha = 1.0;
    if (!isSplashFinish) {
        [self performSelector:@selector(splash) withObject:nil afterDelay:0.3];
    }
}

-(void)splashfinish{
    isSplashFinish = YES;
}

-(void)setTime{
    if (!isStart) {
        waterDrop.hidden = YES;
        return;
    }

    NSArray *times =  [timeLable.text componentsSeparatedByString:@":"];
    min = [[times objectAtIndex:0] intValue];
    sec =[[times objectAtIndex:1] intValue];
    if (!isCountTimeMode ) {
        if (min == 0 && sec == 0) {
            isStart = NO;
            return;
        }
    }
    
    waterDrop.hidden = NO;
    if (isCountTimeMode) {
        sec++;
        NSString *newTime ;
        if (sec<10) {
            if (min < 10) {
                newTime = [NSString stringWithFormat:@"0%d:0%d",min,sec];
            }
            else{
                newTime = [NSString stringWithFormat:@"%d:0%d",min,sec];
            }

        }else{
            if (sec == 59) {
                sec = 0;
                min++;
                if (min < 10) {
                    newTime = [NSString stringWithFormat:@"0%d:%d",min,sec];
                    timeLable.text = newTime;
                    return;
                }
                newTime = [NSString stringWithFormat:@"%d:%d",min,sec];
                timeLable.text = newTime;
                return;
            }
            if (min>10) {
                newTime = [NSString stringWithFormat:@"%d:%d",min,sec];
            }else{
                newTime = [NSString stringWithFormat:@"0%d:%d",min,sec];
            }
        }
        timeLable.text = newTime;
        return;
    }
    
    sec--;
    NSString *newTime ;
    if (sec<10) {
        if (sec == 0 || sec == -1) {
            if (min == 0 && sec == 0) {
                timeLable.text = @"00:00";
                [self timeUp];
                return;
            }
            sec = 59;
            min--;
            if (min<10) {
                 newTime = [NSString stringWithFormat:@"0%d:%d",min,sec];
            }else{
                newTime = [NSString stringWithFormat:@"%d:%d",min,sec];
            }
            timeLable.text = newTime;
            return;
        }
        
        if (min < 10) {
            newTime = [NSString stringWithFormat:@"0%d:0%d",min,sec];
            timeLable.text = newTime;
            if (min == 0 && sec == 0) {
                timeLable.text = @"00:00";
                [self timeUp];
            }

        }
          newTime = [NSString stringWithFormat:@"%d:0%d",min,sec];
          timeLable.text = newTime;
    }else{
        if (min < 10) {
            newTime = [NSString stringWithFormat:@"0%d:%d",min,sec];
            timeLable.text = newTime;
            if (min == 0 && sec == 0) {
                timeLable.text = @"00:00";
                [self timeUp];
            }
            return;
        }else{
            newTime = [NSString stringWithFormat:@"%d:%d",min,sec];
            timeLable.text = newTime;
        }
    }
}

-(void)timeUp{
    NSError *error = [[NSError alloc]init];
    NSString *soundFilePath;
    soundFilePath = [[NSBundle mainBundle] pathForResource:@"didi" ofType: @"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    
    finalPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:&error];
    finalPlayer.numberOfLoops = -1;
    finalPlayer.volume = 1.0;
    
    [finalPlayer prepareToPlay];
    [finalPlayer play];
}

#pragma mark - updateWater
-(void)updateWater:(CGPoint)pos{
    if (isSetTime) {
        if (pos.y
            > 200) {
            water.frame = CGRectMake(0, 200, 320, 640);
            waterWave.frame = CGRectMake(0, 200 -  14, 640, 14);
            return;
            
        }else{
        water.frame = CGRectMake(0, pos.y, 320, 640);
        waterWave.frame = CGRectMake(0, waterWavePosY, 640, 14);
        }
    }
}

-(void)updateWaterWave{
    waterWave.frame = [self nextPosition];
    if (waterWave.frame.origin.x >= 0 && waterWave.frame.origin.y >= 186) {
        [self resetPos:CGPointMake(-320, 186)];
    }else if(waterWave.frame.origin.x >= 0 && waterWave.frame.origin.y < 186){
        [self resetPos:CGPointMake(-320, waterWavePosY)];
    }
}

-(void)resetPos:(CGPoint)pos{
    if (waterWavePosY >= 186) {
        waterWave.frame = CGRectMake(-320, 186, waterWave.frame.size.width, waterWave.frame.size.height);
        return;
    }
    waterWave.frame = CGRectMake(-320
                                 , waterWave.frame.origin.y, waterWave.frame.size.width, waterWave.frame.size.height);
    
}

- (CGRect) nextPosition {
    if (waterWavePosY == 186) {
       
         return CGRectMake(waterWave.frame.origin.x+2, 186,waterWave.frame.size.width,waterWave.frame.size.height);
    }
    return CGRectMake(waterWave.frame.origin.x+2, waterWavePosY,waterWave.frame.size.width,waterWave.frame.size.height);
    
}

float preY;
#pragma mark - touches

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    [self updateWater:location];
    if (!isTimeLineClick) {
        if (location.x >= timeLable.center.x - timeLable.frame.size.width/2 && location.x <= timeLable.center.x + timeLable.frame.size.width/2 && location.y
            > timeLable.center.y - timeLable.frame.size.height/2 && location.y<timeLable.center.y +
            timeLable.frame.size.height/2) {
            NSLog(@"TimeLable Click");
            isTimeLableClick = YES;
            hintLable.hidden = NO;
            timeLable.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
        }else {
            isTimeLableClick = NO;
        }
        if (isTimeLableClick) {
            isPause = YES;
            if (min == 0 && sec == 0) {
                hintLable.hidden = YES;
            }else{
                hintLable.hidden = NO;
            }
            preY = location.y;

            timeLable.center = CGPointMake(timeLable.center.x
                                           , location.y);
            hintLable.center = CGPointMake(timeLable.center.x
                                           , location.y - 40);

            if (!isStart) {
                hintLable.text = @"Drop down to Start";
            }else{
                hintLable.text = @"Drop down to Pause";
            }
  
            if (timeLable.center.y > 125 ) {
                isOverHeight = YES;
            }
            if (timeLable.center.y < 120) {
                isLowerHeight = YES;
            }
        }
    }
    waterWave.hidden = NO;
    if (touchImage.center.y > timeLable.center.y - timeLable.frame.size.height/2 && touchImage.center.y < timeLable.center.y +timeLable.frame.size.height/2) {
        
        if (location.x >= timeLable.center.x + timeLable.frame.size.width/2 ) {
            line.center = CGPointMake(line.center.x, location.y);
            touchImage.center = location;
            isTimeLineClick = YES;
            timeLable.hidden = YES;
            hintLable.hidden = YES;
            line.hidden = NO;
            touchImage.hidden = NO;
            hopeTimeLable.hidden = NO;
            
        }else if(location.x <= timeLable.center.x - timeLable.frame.size.width/2 ){
            line.center = CGPointMake(line.center.x, location.y);
            touchImage.center = location;
            isTimeLineClick = YES;
            timeLable.hidden = YES;
            ;
            hintLable.hidden = YES;
            line.hidden = NO;
            touchImage.hidden = NO;
            hopeTimeLable.hidden = NO;
        }
    }
    else if ( location.y
        > touchImage.center.y - touchImage.frame.size.height/2 && location.y<touchImage.center.y +
        touchImage.frame.size.height/2) {
        
        NSLog(@"x1 %f,x2 %f, y1 %f,y2 %f",touchImage.center.x - touchImage.frame.size.width/2,touchImage.center.x + touchImage.frame.size.width/2 ,touchImage.center.y - touchImage.frame.size.height/2 , touchImage.center.y +
              touchImage.frame.size.height/2 );
        line.center = CGPointMake(line.center.x, location.y);
        touchImage.center = location;
        isTimeLineClick = YES;
        timeLable.hidden = YES;
        hintLable.hidden = YES;
        
        line.hidden = NO;
        touchImage.hidden = NO;
        hopeTimeLable.hidden = NO;
    }

    if (isTimeLineClick) {
        isStart = NO;
        if (location.y > 200) {
            isCountTimeMode = NO;
            touchImage.center = CGPointMake(location.x, 200);
            water.frame = CGRectMake(water.frame.origin.x
                                     , 200, water.frame.size.width, water.frame.size.height);
            
            
            hopeTimeLable.center = CGPointMake(location.x - 40, 200);
            line.center = CGPointMake(0,200);
            waterWave.frame = CGRectMake(waterWave.frame.origin.x, 186, 640, 14);
            timeLable.text = @"00:00";
            hopeTimeLable.text =@"00:00";
            waterWavePosY = 186;
            
        }else if(location.y <40) {
            touchImage.center = CGPointMake(location.x, 40);
            water.frame = CGRectMake(water.frame.origin.x
                                     , 40 - [[UIApplication sharedApplication] statusBarFrame].size.height, water.frame.size.width, water.frame.size.height);
            
            
            hopeTimeLable.center = CGPointMake(location.x - 40, 40);
            line.center = CGPointMake(0,40);
            waterWave.hidden = YES;
            hopeTimeLable.text =@"+∞";
            timeLable.text = @"00:00";
            isCountTimeMode = YES;
        }
    else{
        isCountTimeMode = NO;
        waterWavePosY = location.y - 14 ;
        line.center = CGPointMake(line.center.x, location.y);
        touchImage.center = location;
        water.frame = CGRectMake(water.frame.origin.x
                                 , location.y, water.frame.size.width, water.frame.size.height);
        
        hopeTimeLable.center = CGPointMake(location.x - 40, location.y);
        int time = 0;
        time = (200.0f - location.y)*(80.0f/160.0f);
        if (time < 10) {
            hopeTimeLable.text = [NSString stringWithFormat:@"0%d:00",time];
                timeLable.text = [NSString stringWithFormat:@"0%d:00",time];
            }else{
                hopeTimeLable.text = [NSString stringWithFormat:@"%d:00",time];
                timeLable.text = [NSString stringWithFormat:@"%d:00",time];
            }
        }
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    touchYOffSet = location.y - preY;
    [self touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([finalPlayer isPlaying]) {
        [finalPlayer pause];
        finalPlayer = nil;
    }
    if (isTimeLableClick) {
        if (!isStart) {
            waterDrop.hidden = YES;
        }else{
            waterDrop.hidden = NO;
        }
        timeLable.textColor = [UIColor whiteColor];
        if (isOverHeight) {
            isShouldRaiseTimeBack = YES;
            isOverHeight = NO;
        }
        
        if (isLowerHeight) {
            isShouldPushTimeDown = YES;
            isLowerHeight = NO;
        }

        NSArray *times =  [timeLable.text componentsSeparatedByString:@":"];
        min = [[times objectAtIndex:0] intValue];
        sec =[[times objectAtIndex:1] intValue];
        if (!isCountTimeMode ) {
            if (min == 0 && sec == 0) {
                isStart = NO;
                isTimeLableClick = NO;
                isTimeLineClick = NO;
                timeLable.hidden = NO;
                hintLable.hidden = YES;
                
                line.hidden = YES;
                touchImage.hidden = YES;
                hopeTimeLable.hidden = YES;
                return;
            }
            
        }
        isStart = !isStart;
    }
    
    if (isTimeLineClick) {
        isSplashStart = YES;
        isSplashFinish = NO;
        isStart = YES;
        [self splash];
    }
    
    isTimeLableClick = NO;
    isTimeLineClick = NO;
    timeLable.hidden = NO;
    hintLable.hidden = YES;
    
    line.hidden = YES;
    touchImage.hidden = YES;
    hopeTimeLable.hidden = YES;
}

#pragma mark -player
-(void)initPlayerAndPlay:(NSString *)song{
    if (song == nil) {
        return;
    }
    NSError *error = [[NSError alloc]init];
    NSString *soundFilePath;
    soundFilePath = [[NSBundle mainBundle] pathForResource:song ofType: @"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:&error];
    player.numberOfLoops = 0;
    player.volume = 1.0;
    [player prepareToPlay];
    [player play];
    
}

@end
