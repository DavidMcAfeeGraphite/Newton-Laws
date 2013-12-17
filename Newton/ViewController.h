//
//  ViewController.h
//  Newton
//
//  Created by David McAfee on 15/01/13.
//  Copyright (c) 2013 David McAfee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"
#import <Social/Social.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController {
    IBOutlet UIScrollView *scroller;
    IBOutlet UITextView *text;
    IBOutlet UITextView *text2;
    IBOutlet UITextView *text3;
    IBOutlet UIImageView *animationView;
    
    
    IBOutlet UITextField *Number1;
    IBOutlet UITextField *Number2;
    IBOutlet UILabel *resultLabel;
    
    IBOutlet UITextField *Number3;
    IBOutlet UITextField *Number4;
    
}
-(IBAction)correct;
-(IBAction)incorrect;
-(IBAction)ballRamp;
@property(nonatomic,retain)IBOutlet UITextView *text;
@property(nonatomic,retain)IBOutlet UITextView *text2;
@property(nonatomic,retain)IBOutlet UITextView *text3;
-(IBAction)read;
-(IBAction)playMovie:(id)sender;
-(IBAction)playMovie2:(id)sender;
-(IBAction)playMovie3:(id)sender;
-(IBAction)playMovie4:(id)sender;

@property (retain, nonatomic) UITextField *Number1;
@property (retain, nonatomic) UITextField *Number2;
@property (retain, nonatomic) UITextField *Number3;
@property (retain, nonatomic) UITextField *Number4;
@property (retain, nonatomic) UILabel *resultLabel;
-(IBAction)calculateMultiply:(id)sender;
-(IBAction)calculateDivide:(id)sender;

@end
