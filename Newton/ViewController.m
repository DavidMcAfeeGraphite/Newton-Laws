//
//  ViewController.m
//  Newton
//
//  Created by David McAfee on 15/01/13.
//  Copyright (c) 2013 David McAfee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize text;
@synthesize text2;
@synthesize text3;
@synthesize Number1;
@synthesize Number2;
@synthesize Number3;
@synthesize Number4;
@synthesize resultLabel;

- (void)viewDidLoad
{ [scroller setScrollEnabled:YES];
	[scroller setContentSize:CGSizeMake(640, 1136)];
    
    text.editable = NO;
    text2.editable = NO;
    text3.editable = NO;
    
    BOOL ranBefore = [[NSUserDefaults standardUserDefaults]boolForKey:@"RanBefore"];
    if(!ranBefore) {
    
    NSDate *alertTime1 = [NSDate dateWithTimeIntervalSince1970:1393959600];
    
    UILocalNotification *localNotification1 = [[UILocalNotification alloc] init];
    
    localNotification1.fireDate = alertTime1;
    localNotification1.alertBody = @"Like the videos, minibook and quizzes in Newton's 3 Laws? Why not write an app review? Have any suggestions? Email us through graphite100@gmail.com!";
    localNotification1.timeZone = [NSTimeZone localTimeZone];
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification1];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Welcome to Newton's Three Laws 2.0" message:@"This latest update brings new features such as videos, a calculator and a chapter view. We welcome your feedback either through Twitter (@Graphite100) or through email (graphite100@gmail.com). Send us any feature requests you have."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];

    
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RanBefore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)calculateMultiply:(id)sender {

    double result = [Number1.text doubleValue] * [Number2.text doubleValue];
    resultLabel.text = [NSString stringWithFormat:@"%f", result];
}

-(IBAction)calculateDivide:(id)sender {
    
    double result = [Number3.text doubleValue] / [Number4.text doubleValue];
    resultLabel.text = [NSString stringWithFormat:@"%f", result];
}

-(IBAction)playMovie:(id)sender {
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Newton Video Acceleration" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}
-(IBAction)playMovie2:(id)sender {
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Newton Video Force" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}
-(IBAction)playMovie3:(id)sender {
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Newton Video Reaction" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}
-(IBAction)playMovie4:(id)sender {
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Newton Video Momentum" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}


- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
}

- (IBAction)postToFacebook:(id)sender{
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [controller setInitialText:@"Check out GRAPHITE Education and Entertainment apps on the App Store"];
        [controller addURL:[NSURL URLWithString:@"https://itunes.apple.com/au/artist/graphite/id469378393"]];
        [self presentViewController:controller animated:YES completion:Nil];}
    
    else {
        NSLog(@"FacebookButton");
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Facebook Available"
                                                       message: @"In order to share to Facebook, you must have at least one Facebook account configured under settings of the iOS device"
                                                      delegate: self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        [alert show];
        
        
    }
}

- (IBAction)postToTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Check out GRAPHITE Education and Entertainment apps on the App Store"];
        [tweetSheet addURL:[NSURL URLWithString:@"https://itunes.apple.com/au/artist/graphite/id469378393"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"TwitterButton");
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Twitter Available"
                                                       message: @"In order to share to Twitter, you must have at least one Twitter account configured under settings of the iOS device"
                                                      delegate: self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)graphiteApps {
    
    NSURL *myURL = [[NSURL alloc] initWithString:@"https://itunes.apple.com/au/app/formulae/id639360217?mt=8"];
    [[UIApplication sharedApplication] openURL:myURL];
}

-(IBAction)read {
    ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ChapterView"];
    [self.navigationController pushViewController:controller animated:YES];
}



-(IBAction)correct {
    CustomAlertView *customAlertView = [[CustomAlertView alloc]initWithTitle:@"Correct"
                                                                     message:@"Congratulations, that answer is right."
                                                                    delegate:self
                                                           cancelButtonTitle:@"Yay"
                                                           otherButtonTitles:nil];
	[customAlertView show];
	[customAlertView release];
    
    

    
}
-(IBAction)incorrect {
    CustomAlertView *customAlertView = [[CustomAlertView alloc]initWithTitle:@"Incorrect"
                                                                     message:@"Have another go."
                                                                    delegate:self
                                                           cancelButtonTitle:@"Try again"
                                                           otherButtonTitles:nil];
	[customAlertView show];
	[customAlertView release];
    
    

    
}

-(IBAction)ballRamp:(id)sender {
    animationView.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"ball1.png"],
                                 [UIImage imageNamed:@"ball2.png"],
                                 [UIImage imageNamed:@"ball3.png"],
                                 [UIImage imageNamed:@"ball4.png"],
                                 [UIImage imageNamed:@"ball5.png"],
                                 [UIImage imageNamed:@"ball6.png"],
                                 [UIImage imageNamed:@"ball7.png"],
                                 [UIImage imageNamed:@"ball8.png"],
                                 [UIImage imageNamed:@"ball9.png"],
                                     [UIImage imageNamed:@"ball10.png"],nil];
    [animationView setAnimationRepeatCount:0];
    animationView.animationDuration = 1;
    [animationView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
