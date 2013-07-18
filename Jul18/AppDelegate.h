//
//  AppDelegate.h
//  Jul18
//
//  Created by andrew rodney on 7/15/13.
//  Copyright (c) 2013 andrew rodney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    AVAudioPlayer *music;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

- (IBAction)squeeze:(UIButton *)sender;

@end
