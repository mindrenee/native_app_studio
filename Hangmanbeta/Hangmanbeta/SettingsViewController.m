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

    _lengthField = [[UITextField alloc] initWithFrame:CGRectMake(150, 250, 35, 25)];
    _lengthField.backgroundColor = [UIColor whiteColor];
    _lengthField.placeholder = @"7";
    [self.view addSubview:_lengthField];
    
    UIButton *saveButton = [[UIButton alloc]init];
    [saveButton addTarget:self
                   action:@selector(save:)
forControlEvents:UIControlEventTouchDown];
    saveButton.frame = CGRectMake(25.0, 300.0, 50.0, 30.0);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void) save: (id)sender
{
    if([_lengthField.text intValue] > 2 && [_lengthField.text intValue] < 8)
    {
        [[GameManager sharedManager] setPlayername:_nameField.text];
        //[[GameManager sharedManager] setWordLength:[_lengthField.text intValue]];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                        message:@"Word length must be between 3 and 7"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
