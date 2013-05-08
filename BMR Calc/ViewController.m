//
//  ViewController.m
//  BMR Calc
//
//  Created by Jon Leemon on 4/30/13.
//  Copyright (c) 2013 Jon Leemon. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize height;
@synthesize weight;
@synthesize age;
@synthesize stressFactor;
@synthesize miffBMR;
@synthesize miffEEN;
@synthesize sex;

- (IBAction)calculate
{
    double h = [height.text doubleValue];
    double w = [weight.text doubleValue];
    double a = [age.text doubleValue];
    double s = [stressFactor.text doubleValue];
    
    double maleMiff = (10*w)+(6.25*(h*2.54))-(5*a)+5;
    double maleEEN = maleMiff*s;
    
    miffBMR.text = [[NSString alloc] initWithFormat:@"%4.f", maleMiff];
    miffEEN.text = [[NSString alloc] initWithFormat:@"%3.f", maleEEN];
    
//    NSString *totalString = [NSString stringWithFormat:@"%f", maleMiff];
  //  _miffBMR.text = totalString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == height)
    {
        [weight becomeFirstResponder];
        
    }
    else if(textField == weight)
    {
        [age becomeFirstResponder];
    }
    else if(textField == age)
    {
        [stressFactor becomeFirstResponder];
    }
    else if(textField==stressFactor)
    {
        [stressFactor resignFirstResponder];
    }
    return NO;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
