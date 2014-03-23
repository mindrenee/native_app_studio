//
//  SettingsViewController.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface SettingsViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) UITextField *nameField;
@property (strong, nonatomic) UITextField *lengthField;
@property (strong, nonatomic) UISlider *slider;

@end
