//
//  ViewController.h
//  BMR Calc
//
//  Created by Jon Leemon on 4/30/13.
//  Copyright (c) 2013 Jon Leemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UISegmentedControl *sex;
    IBOutlet UITextField *miffEEN;
    IBOutlet UITextField *miffBMR;
    IBOutlet UITextField *height;
    IBOutlet UITextField *weight;
    IBOutlet UITextField *age;
    IBOutlet UITextField *stressFactor;
}


@property (retain, nonatomic) IBOutlet UITextField *height;
@property (retain, nonatomic) IBOutlet UITextField *weight;
@property (retain, nonatomic) IBOutlet UITextField *age;
@property (retain, nonatomic) IBOutlet UITextField *stressFactor;
@property (retain, nonatomic) IBOutlet UITextField *miffBMR;
@property (retain, nonatomic) IBOutlet UITextField *miffEEN;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sex;



- (IBAction)calculate;
- (IBAction)clear;
@end
