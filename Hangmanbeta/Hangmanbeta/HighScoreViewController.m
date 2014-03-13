//
//  HighScoreViewController.m
//  Hangmanbeta
//
//  Created by R Witsenburg on 09-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "HighScoreViewController.h"

@interface HighScoreViewController ()

@end

@implementation HighScoreViewController

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
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    GameManager *sharedManager = [GameManager sharedManager];

    for(int i = 0; i < 5; i++)
    {
        UILabel *player = [[UILabel alloc]init];
        [player setText:sharedManager.playername];
        player.textColor = [UIColor whiteColor];
        player.frame = CGRectMake(30, 200, 55, 30);
        [self.view addSubview:player];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
