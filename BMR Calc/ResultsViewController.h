//
//  ResultsViewController.h
//  BMR Calc
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *miffBMRLabel;
@property (weak, nonatomic) IBOutlet UITextField *miffEENLabel;

@property(nonatomic, strong) NSString *miffBMR;

@end
