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
    
    UILabel *text = [[UILabel alloc]init];
    [text setText:@"Highscore:"];
    text.textColor = [UIColor whiteColor];
    text.frame = CGRectMake(30, 200, 90, 30);
    [self.view addSubview:text];

    [self loadHighscore];
}

- (void) loadHighscore
{
    NSInteger lastHighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"high_score"];
    NSLog(@"%d", lastHighScore);
    
    NSString *highscore = [NSString stringWithFormat:@"%d", lastHighScore];
    
    UILabel *number = [[UILabel alloc]init];
    [number setText:highscore];
    number.textColor = [UIColor whiteColor];
    number.frame = CGRectMake(120, 200, 55, 30);
    [self.view addSubview:number];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
