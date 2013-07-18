//
//  AppDelegate.m
//  Jul18
//
//  Created by andrew rodney on 7/15/13.
//  Copyright (c) 2013 andrew rodney. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
BOOL a = FALSE;

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    

      //  NSString *title = [sender titleForState:UIControlStateNormal];
       // statusText.text=[NSString stringWithFormat:@"%@ button pressed.", title];
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
        return YES;
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: @"indy_theme" ofType: @"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
        return YES;
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    music = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (music == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    music.volume = 1.0;		//the default
    music.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![music prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
  
        if (![music play])
        {
            NSLog(@"could not play");
        }
    
    return YES;
 
    }

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
