//
//  SettingsViewController.m
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:34.0f/255.0f green:139.0f/255.0f blue:34.0f/255.0f alpha:1.0]];
	// Do any additional setup after loading the view.
    UILabel *name = [[UILabel alloc]init];
    [name setText:@"Naam:"];
    name.textColor = [UIColor whiteColor];
    name.frame = CGRectMake(30, 200, 55, 30);
    [self.view addSubview:name];
    
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(95, 203, 150, 25)];
    _nameField.backgroundColor = [UIColor whiteColor];
    _nameField.placeholder = @"Player";
    [self.view addSubview:_nameField];
    
    UILabel *length = [[UILabel alloc]init];
    [length setText:@"Lengte Woord:"];
    length.textColor = [UIColor whiteColor];
    length.frame = CGRectMake(30, 250, 150, 30);
    [self.view addSubview:length];

    CGRect frame = CGRectMake(150, 265, 130.0, 5.0);
    _slider = [[UISlider alloc] initWithFrame:frame];
    [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [_slider setBackgroundColor:[UIColor clearColor]];
    _slider.minimumValue = 3;
    _slider.maximumValue = 7;
    _slider.continuous = YES;
    _slider.value = 5;
    [self.view addSubview:_slider];
    
    UILabel *currentValue = [[UILabel alloc]init];
    [currentValue setText:@"5"];
    currentValue.textColor = [UIColor whiteColor];
    currentValue.frame = CGRectMake(290, 250, 20, 30);
    [self.view addSubview:currentValue];

    UIButton *saveButton = [[UIButton alloc]init];
    [saveButton addTarget:self
                   action:@selector(save:)
forControlEvents:UIControlEventTouchDown];
    saveButton.frame = CGRectMake(25.0, 300.0, 50.0, 30.0);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];

}

-(void)sliderAction
{
    
    UIView *resetLabel = [[UIView alloc]init];
    [resetLabel setBackgroundColor:[UIColor colorWithRed:34.0f/255.0f green:139.0f/255.0f blue:34.0f/255.0f alpha:1.0]];
    resetLabel.frame = CGRectMake(290, 250, 20, 30);
    [self.view addSubview:resetLabel];
    
    //-- Do further actions
    //NSLog(@"Slider value %f", _slider.value);
    UILabel *currentValue = [[UILabel alloc]init];
    //currentValue.text = @"";
    NSString *sliderValue = [NSString stringWithFormat:@"%d",(int)_slider.value];
    [currentValue setText:sliderValue];
    currentValue.textColor = [UIColor whiteColor];
    currentValue.frame = CGRectMake(290, 250, 20, 30);
    [self.view addSubview:currentValue];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void) save: (id)sender
{
        [[GameManager sharedManager] setPlayername:_nameField.text];
        int sliderValue = (int) _slider.value;
        [[GameManager sharedManager] setWordLength:sliderValue];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
