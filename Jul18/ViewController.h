//
//  ViewController.h
//  Jul18
//
//  Created by andrew rodney on 7/15/13.
//  Copyright (c) 2013 andrew rodney. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController : UIViewController
{
    MPMoviePlayerController *player;
    MPMoviePlayerController *controller;
    UIWindow *window;
    AVAudioPlayer *music;
}



@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
- (IBAction)press:(UIButton *)sender;
- (IBAction)squeeze:(UIButton *)sender;




@end
