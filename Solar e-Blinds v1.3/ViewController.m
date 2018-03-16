//
//  ViewController.m
//  Solar e-Blinds v1.3
//
//  Created by Fahd Syed on 2013-03-29.
//  Copyright (c) 2013 All rights reserved.
//

#import "ViewController.h"

//#define animationSpeed 5
//#define timeDelay 0

@interface ViewController ()
{
    NSURLConnection *arduinoConnection;
}
@end



@implementation ViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    [Scroller setScrollEnabled:YES];
    [Scroller setContentSize:CGSizeMake(320, 1000)];
	// Do any additional setup after loading the view, typically from a nib.
  //  [self performSelector:@selector(fadeOutImageView) withObject:nil afterDelay:0];


    
}
/*
-(void) fadeOutImageView {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:timeDelay];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    imageView.alpha = 0;
    
    [UIView commitAnimations];
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)RunArduinoConnection: (NSURL *)urlConnection
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlConnection];
    arduinoConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [arduinoConnection start];
}

//These are the functions that are fired when a button is pressed.

- (IBAction)TiltSegmentPressed:(UIButton *)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSURL *tiltURL = nil;
    if(segmentedControl.selectedSegmentIndex == 0)
    {//TILT OPEN
        tiltURL = [NSURL URLWithString:@"http://192.168.2.27/Y"];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {//TILT CLOSE
        tiltURL = [NSURL URLWithString:@"http://192.168.2.27/Z"];
    }
    [self RunArduinoConnection:tiltURL];
}

- (IBAction)RollSegmentPressed:(UIButton *)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSURL *rollURL = nil;
    if(segmentedControl.selectedSegmentIndex == 0)
    {//ROLL UP
        rollURL = [NSURL URLWithString:@"http://192.168.2.27/O"];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {//ROLL UP
        rollURL = [NSURL URLWithString:@"http://192.168.2.27/C"];
    }
    else if(segmentedControl.selectedSegmentIndex == 2)
    {//AUTOMATIC
        tiltURL = [NSURL URLWithString:@"http://192.168.0.100/A"];
    }
    [self RunArduinoConnection:rollURL];
}





- (IBAction)PageSegmentPressed:(UIButton *)sender
{
    if(control.selectedSegmentIndex == 0){
        button1.hidden = NO;
        button2.hidden = NO;
    }
else if (control.selectedSegmentIndex == 1){
    button1.hidden = NO;
}
}
 

#pragma mark -
#pragma mark NSURLConnection Delegate Methods
 

 //this method might be calling more than one times according to incoming data size
 
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
}

 //if there is an error occured, this method will be called by connection
 
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    connection = nil;
}


// if data is successfully received, this method will be called by connection
 
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    connection = nil;
}
*/



@end
