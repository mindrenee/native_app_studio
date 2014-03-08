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
    
    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(95, 203, 150, 25)];
    nameField.backgroundColor = [UIColor whiteColor];
    nameField.placeholder = @"Player";
    [self.view addSubview:nameField];
    
    UILabel *length = [[UILabel alloc]init];
    [length setText:@"Lengte Woord:"];
    length.textColor = [UIColor whiteColor];
    length.frame = CGRectMake(30, 250, 150, 30);
    [self.view addSubview:length];

    UITextField *lengthField = [[UITextField alloc] initWithFrame:CGRectMake(150, 250, 35, 25)];
    lengthField.backgroundColor = [UIColor whiteColor];
    lengthField.placeholder = @"7";
    [self.view addSubview:lengthField];
    
    UIButton *saveButton = [[UIButton alloc]init];
    [saveButton addTarget:self
                   action:@selector(save:)
forControlEvents:UIControlEventTouchDown];
    saveButton.frame = CGRectMake(25.0, 300.0, 50.0, 30.0);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
}

- (void) save:(NSString *)player lengthWord: (int) length
{
    //GameManager *sharedManager = [GameManager sharedManager];
    [[GameManager sharedManager] setPlayername:player];
    
    
    
    NSLog(@"save");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
