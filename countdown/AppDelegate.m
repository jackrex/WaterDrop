//
//  AppDelegate.m
//  countdown
//
//  Created by JackRex on 4/3/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UMSocialData setAppKey:@"534114c256240b5a2f12abf2"];
    return YES;
}
							
@end
