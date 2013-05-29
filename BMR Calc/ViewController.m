//
//  ViewController.m
//  BMR Calc
//
//  Created by Jon Leemon on 4/30/13.
//  Copyright (c) 2013 Jon Leemon. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ResultsViewController.h"

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
@synthesize miffEEN_1;
@synthesize miffEEN_2;

- (IBAction)calculate
{
    double h = [height.text doubleValue];
    double w = [weight.text doubleValue];
    double a = [age.text doubleValue];
    double s = [stressFactor.text doubleValue];
    
    double maleMiff = (10*w)+(6.25*(h*2.54))-(5*a)+5;
    double maleMiffEEN = maleMiff*s;
    
    // double maleHarr = 66.5+(13.75*w)+(5.003*(h*2.54))-(6.775*a);
    // double maleHarrEEN = maleHarr*s;
    
    // double femaleMiff = (10*w)+(6.25*(h*2.54))-(5*a)-161;
    // double femaleMiffEEN = femaleMiff*s;
    
    // double femaleHarr = 655.1+(9.563*w)+(1.85*(h*2.54))-(4.676*a);
    // double femaleHarrEEN = femaleHarr*s;
    
//    miffBMR.text = [[NSString alloc] initWithFormat:@"%4.f", maleMiff];
//    miffEEN.text = [[NSString alloc] initWithFormat:@"%3.f", maleMiffEEN];
//    
//    miffEEN_1.text = [[NSString alloc] initWithFormat:@"%4.f", maleMiffEEN-maleMiffEEN*.1];
//    miffEEN_2.text = [[NSString alloc] initWithFormat:@"%4.f", maleMiffEEN+maleMiffEEN*.1];
    
    // Save formated string value here
    miffBMRvalue = [[NSString alloc] initWithFormat:@"%4.f", maleMiff];

}

- (IBAction)clear
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // We named our segue so we could identify it here
    if([segue.identifier isEqualToString:@"showResultsSegue"]){
        // Grab the desination controller which is the "ResultsViewController" in this case
        ResultsViewController *destViewController = segue.destinationViewController;
        
        // Set the properties that we have exposed on the controller with the value we want to pass
        destViewController.miffBMR = miffBMRvalue;
        
    }
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
