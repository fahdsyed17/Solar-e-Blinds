//
//  ViewController2.h
//  Solar e-Blinds v1.3
//
//  Created by Fahd Syed on 2013-03-31.
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController{
    IBOutlet UISwitch *switchButton;
    IBOutlet UISegmentedControl *segmentedControl1;
    IBOutlet UISegmentedControl *segmentedControl2;
    IBOutlet UISegmentedControl *segmentedControl3;
    IBOutlet UISegmentedControl *segmentedControl4;
    IBOutlet UISegmentedControl *segmentedControl5;
    IBOutlet UISegmentedControl *segmentedControl6;
    IBOutlet UISegmentedControl *segmentedControl7;
    
    IBOutlet UILabel *label;
    
    IBOutlet UIActivityIndicatorView *activityindicator;    
}

@property (nonatomic, retain)IBOutlet UIActivityIndicatorView *activityindicator;

- (void)RunArduinoConnection: (NSURL *)urlConnection;
- (IBAction)TiltSegmentPressed:(UIButton *)sender;
- (IBAction)RollSegmentPressed:(UIButton *)sender;
- (IBAction)Settingspageselected:(UIButton *)sender;
@end
