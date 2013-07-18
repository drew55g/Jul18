//
//  ViewController.m
//  Jul18
//
//  Created by andrew rodney on 7/15/13.
//  Copyright (c) 2013 andrew rodney. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@end


@implementation ViewController

int i=0;


// Animation code
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event
{
    i = 1-i;
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:2.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    
    if (i == 0)
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [self.view1 removeFromSuperview]; [self.view addSubview:self.view2];
    }
    
    if (i == 1)
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.view2 removeFromSuperview]; [self.view addSubview:self.view1];
    }
    [UIView commitAnimations];
    
}





- (void)viewDidLoad
{
    NSString *url1 = [[NSBundle mainBundle] pathForResource:@"sneeze" ofType:@"m4v"];
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:url1]];
    [[NSNotificationCenter defaultCenter]
     
     addObserver:self selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    
    //---set the size of the movie view and then add it to the View window---
    player.view.frame = CGRectMake(10, 10, 300, 200); [self.view addSubview:player.view];
    //---play movie---
  
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: @"mnf_theme_music" ofType: @"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
        //return YES;
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    music = [[AVAudioPlayer alloc]
             initWithContentsOfURL: url error: &error];
    if (music == nil) {
        NSLog(@"error == %@", error);
       // return YES;
    }
    
    music.volume = 1.0;		//the default
    music.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![music prepareToPlay]) {
        NSLog(@"could not prepare to play");
      //  return YES;
    }

}

//---called when the movie is done playing---
- (void) movieFinishedCallback:(NSNotification*) aNotification
{ MPMoviePlayerController *moviePlayer = [aNotification object]; [[NSNotificationCenter defaultCenter]
    removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification
    object:moviePlayer]; [moviePlayer.view removeFromSuperview];
}





- (IBAction)press:(UIButton *)sender
{
      [player play];
}

- (IBAction)squeeze:(UIButton *)sender
{
    [music play];
}



@end

