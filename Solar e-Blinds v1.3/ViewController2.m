//
//  ViewController2.m
//  Solar e-Blinds v1.3
//
//  Created by Fahd Syed on 2013-03-31.
//  Copyright (c) 2013 EE 4OI6 - GROUP B16. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

#define animationSpeed 0.2
#define timeDelay 0.2

@interface ViewController2 (){
    NSURLConnection *arduinoConnection;
}



@end

@implementation ViewController2
@synthesize activityindicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//------------------------------------


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//------------------------------------


-(void)RunArduinoConnection: (NSURL *)urlConnection
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlConnection];
    arduinoConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [arduinoConnection start];
}


//------------------------------------

// TILT SEGMENT
//These are the functions that are fired when a button is pressed.

- (IBAction)TiltSegmentPressed:(UIButton *)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSURL *tiltURL = nil;
    if(segmentedControl.selectedSegmentIndex == 0)
    {//TILT OPEN
        
        [self performSelector:@selector(open_hide)withObject:nil afterDelay:0.0];

        [self performSelector:@selector(open_show)withObject:nil afterDelay:5.0];

        tiltURL = [NSURL URLWithString:@"http://192.168.2.27/Y"];
    
    }
    else if(segmentedControl.selectedSegmentIndex == 1) 
    {//TILT CLOSE
    
        [self performSelector:@selector(close_hide) withObject:nil afterDelay:0.0];
        
        [self performSelector:@selector(close_show)withObject:nil afterDelay:5.0];

        tiltURL = [NSURL URLWithString:@"http://192.168.2.27/Z"];
        
    }
    [self RunArduinoConnection:tiltURL];
}

//-------------------------------------------------------------------------------

//OPTION OPEN

-(void) open_hide {
    
    segmentedControl4.hidden = YES;
    segmentedControl5.hidden = YES;
    segmentedControl1.hidden = YES;
    segmentedControl2.hidden = YES;
    switchButton.hidden = YES;
    
    switchButton.enabled = NO;
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Loading...";
    [self.navigationController setNavigationBarHidden:YES];

}

-(void) open_show {
    
    [activityindicator stopAnimating];
    label.hidden = YES;
    segmentedControl4.hidden = NO;
    segmentedControl5.hidden = NO;
    segmentedControl1.hidden = NO;
    segmentedControl2.hidden = NO;
    switchButton.hidden = NO;

    switchButton.enabled = YES;
    
    [self.navigationController setNavigationBarHidden:NO];

}


//-------------------------------------------------------------------------------


//OPTION CLOSE

-(void) close_hide {
    
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Loading...";
    segmentedControl4.hidden = YES;
    segmentedControl5.hidden = YES;
    segmentedControl1.hidden = YES;
    segmentedControl2.hidden = YES;
    switchButton.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) close_show {
    
    [activityindicator stopAnimating];
    segmentedControl4.hidden = NO;
    segmentedControl5.hidden = NO;
    segmentedControl1.hidden = NO;
    segmentedControl2.hidden = NO;
    switchButton.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO];
    
    label.hidden = YES;
    
}


//-------------------------------------------------------------------------------
/*

-(void) fadeOutImageView {
    [UISegmentedControl beginAnimations:NULL context:nil];

    [UISegmentedControl setAnimationDuration:animationSpeed];

    
    [UISegmentedControl setAnimationDelay:timeDelay];

    
    [UISegmentedControl setAnimationCurve:UIViewAnimationCurveEaseInOut];

    
    [UISegmentedControl setAnimationBeginsFromCurrentState:YES];
    
    switchButton.hidden = YES;
    
    segmentedControl1.alpha = 0;
    segmentedControl2.alpha = 0;
    segmentedControl3.alpha = 0;
    segmentedControl4.alpha = 0;
    segmentedControl5.alpha = 0;
    segmentedControl6.alpha = 0;
    segmentedControl7.alpha = 0;
    
    

    [UISegmentedControl commitAnimations];
    

}

-(void) fadeInImageView {
    [UISegmentedControl beginAnimations:NULL context:nil];
    
    [UISegmentedControl setAnimationDuration:animationSpeed];
    
    
    [UISegmentedControl setAnimationDelay:timeDelay];
    
    
    [UISegmentedControl setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    switchButton.hidden = NO;
    
    
    segmentedControl1.alpha = 1;
    segmentedControl2.alpha = 1;
    segmentedControl3.alpha = 1;
    segmentedControl4.alpha = 1;
    segmentedControl5.alpha = 1;
    segmentedControl6.alpha = 1;
    segmentedControl7.alpha = 1;
    
    [UISegmentedControl setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
    
}


-(void)animationFinished:(NSString *)animationID
                finished:(NSNumber *)finished
                 context:(void *)context
{
	// Code to be executed on completion of animation sequence
}

*/


//-------------------------------------------------------------------------------


// ROLL SEGMENT


- (IBAction)RollSegmentPressed:(UIButton *)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSURL *rollURL = nil;
    if(segmentedControl.selectedSegmentIndex == 0)
    {//ROLL UP
        [self performSelector:@selector(up_hide) withObject:nil afterDelay:0.0];
        
        [self performSelector:@selector(up_show)withObject:nil afterDelay:5.0];

        
        rollURL = [NSURL URLWithString:@"http://192.168.2.27/O"];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {//ROLL UP
        
        
        [self performSelector:@selector(down_hide) withObject:nil afterDelay:0.0];
        
        [self performSelector:@selector(down_show)withObject:nil afterDelay:5.0];

        rollURL = [NSURL URLWithString:@"http://192.168.2.27/C"];
    }
    /* else if(segmentedControl.selectedSegmentIndex == 2)
     {//AUTOMATIC
     tiltURL = [NSURL URLWithString:@"http://192.168.0.100/A"];
     }*/
    [self RunArduinoConnection:rollURL];
}


//-------------------------------------------------------------------------------


// OPTION UP

-(void) up_hide {
    
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Loading...";
    segmentedControl4.hidden = YES;
    segmentedControl5.hidden = YES;
    segmentedControl1.hidden = YES;
    segmentedControl2.hidden = YES;
    switchButton.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) up_show {
    
    [activityindicator stopAnimating];
    segmentedControl4.hidden = NO;
    segmentedControl5.hidden = NO;
    segmentedControl1.hidden = NO;
    segmentedControl2.hidden = NO;
    switchButton.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO];
    
    label.hidden = YES;
    
    
    //activityindicator.hidden = NO;
    // sleep(5);
    
}


//-------------------------------------------------------------------------------


// OPTION DOWN

-(void) down_hide {
    
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Loading...";
    segmentedControl4.hidden = YES;
    segmentedControl5.hidden = YES;
    segmentedControl1.hidden = YES;
    segmentedControl2.hidden = YES;
    switchButton.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) down_show {
    
    [activityindicator stopAnimating];
    segmentedControl4.hidden = NO;
    segmentedControl5.hidden = NO;
    segmentedControl1.hidden = NO;
    segmentedControl2.hidden = NO;
    switchButton.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO];
    
    label.hidden = YES;
    
    
    //activityindicator.hidden = NO;
    // sleep(5);
    
}


//-------------------------------------------------------------------------------


-(void) eco_hide {
    
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Temperature Sensor turning on...";
    segmentedControl1.hidden = YES;
    switchButton.hidden = YES;
}

-(void) eco_show {
    
    label.hidden = YES;

    [activityindicator stopAnimating];
    segmentedControl1.hidden = NO;
    switchButton.hidden = NO;
}


//-------------------------------------------------------------------------------

-(void) sensorOn_hide {
    
    [activityindicator startAnimating];
    label.hidden = NO;
    label.text = @"Light Sensor turning on...";
    segmentedControl1.hidden = YES;
    switchButton.hidden = YES;
    segmentedControl3.hidden = YES;
    segmentedControl6.hidden = YES;
    segmentedControl7.hidden = YES;
    
}

-(void) sensorOn_show {
    
    label.hidden = YES;
    
    [activityindicator stopAnimating];
    segmentedControl1.hidden = NO;
    switchButton.hidden = NO;
    segmentedControl3.hidden = NO;
    segmentedControl1.enabled = NO;
    segmentedControl3.enabled = YES;

    segmentedControl6.hidden = NO;
    segmentedControl7.hidden = NO;
}
//-------------------------------------------------------------------------------


#pragma mark -
#pragma mark NSURLConnection Delegate Methods
/*
 this method might be calling more than one times according to incoming data size
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
}
/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    connection = nil;
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    connection = nil;
}















- (IBAction)Settingspageselected:(UIButton *)sender {
    //First Segment and Switch relationship
    
    NSURL *sensorOnURL = nil;
    NSURL *EcoOnURL = nil;



    if(segmentedControl1.selectedSegmentIndex == 2)
        switchButton.enabled = YES;
    else if(segmentedControl1.selectedSegmentIndex == 1)
        switchButton.enabled = YES;
        else if(segmentedControl1.selectedSegmentIndex == 0)
            switchButton.enabled = YES;
            else
                switchButton.enabled = NO;
  
    
    
    
    //Manual is selected and switch is ON
    if(switchButton.on && segmentedControl1.selectedSegmentIndex == 0)
    {
        segmentedControl1.enabled = NO;
        segmentedControl2.enabled = YES;
        segmentedControl2.hidden = NO;
        segmentedControl3.hidden = YES;
        
        segmentedControl4.hidden = NO;
        segmentedControl5.hidden = NO;
   
    }//Automatic is selected and switch is ON
    if(switchButton.on && segmentedControl1.selectedSegmentIndex == 1)
    {
       
        sensorOnURL = [NSURL URLWithString:@"http://192.168.2.27/O"];

        
        [self RunArduinoConnection:sensorOnURL];
        
        [self performSelector:@selector(sensorOn_hide)withObject:nil afterDelay:0.0];
        [self performSelector:@selector(sensorOn_show)withObject:nil afterDelay:5.0];
    }
    //switch is OFF
    if(!switchButton.on)
    {
        segmentedControl1.enabled = YES;
        segmentedControl2.enabled = NO;
        segmentedControl3.enabled = NO;
        segmentedControl4.enabled = NO;
        segmentedControl5.enabled = NO;
        segmentedControl6.enabled = NO;
        segmentedControl7.enabled = NO;
        segmentedControl2.hidden = YES;
        segmentedControl3.hidden = YES;
        segmentedControl4.hidden = YES;
        segmentedControl5.hidden = YES;
        segmentedControl6.hidden = YES;
        segmentedControl7.hidden = YES;

    }
    
    if(segmentedControl3.selectedSegmentIndex == 0)
        segmentedControl6.enabled = YES;
    else if(segmentedControl3.selectedSegmentIndex == 1)
        segmentedControl7.enabled = YES;
        else
    {
        segmentedControl6.enabled = NO;
        segmentedControl7.enabled = NO;
    }
    
    
    if(switchButton.on && segmentedControl2.enabled == YES && segmentedControl2.selectedSegmentIndex == 0)
    {
        segmentedControl4.enabled = YES;
        segmentedControl5.enabled = NO;
    }
    else if(switchButton.on && segmentedControl2.enabled == YES && segmentedControl2.selectedSegmentIndex == 1)
    {
        segmentedControl4.enabled = NO;
        segmentedControl5.enabled = YES;
    }
    
     if(switchButton.on && segmentedControl3.enabled == YES && segmentedControl3.selectedSegmentIndex == 1)
    {
        segmentedControl6.enabled = NO;
        segmentedControl7.enabled = YES;
    }
    
    if(segmentedControl1.selectedSegmentIndex == 2 && switchButton.on)
    {
        EcoOnURL = [NSURL URLWithString:@"http://192.168.2.27/O"];
        [self RunArduinoConnection:EcoOnURL];

        segmentedControl1.enabled = NO;

        [self performSelector:@selector(eco_hide)withObject:nil afterDelay:0.0];
        [self performSelector:@selector(eco_show)withObject:nil afterDelay:5.0];

    }
    
    //if(segmentedControl1.selectedSegmentIndex == 2 && switchButton.on)
}



@end
