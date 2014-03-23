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
    self.title = @"Highscore";
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    /*UILabel *text = [[UILabel alloc]init];
    [text setText:@"Highscore:"];
    text.textColor = [UIColor whiteColor];
    text.frame = CGRectMake(30, 200, 90, 30);
    [self.view addSubview:text];*/

    [self loadHighscore];
    //[[GameManager sharedManager] resetGameManager];
}

- (void) loadHighscore
{
    
    NSDictionary *plistRead = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    
    NSArray *arrayRead = [plistRead objectForKey:@"data"];
    NSString *playerName;
    NSString *scoreValue;
    int enter = 0;
    for(int y = 0; y <arrayRead.count; y++)
    {
        if(y%2==0){
            NSLog(@"player: %@", arrayRead[y]);
            playerName = [NSString stringWithFormat:@"%@",arrayRead[y]];
            
        }
        else{
            NSLog(@"score: %@", arrayRead[y]);
            scoreValue = [NSString stringWithFormat:@"%@",arrayRead[y]];
        }
        
        UILabel *player = [[UILabel alloc]init];
        [player setText:playerName];
        player.textColor = [UIColor whiteColor];
        player.frame = CGRectMake(30, 100 + enter, 90, 30);
        [self.view addSubview:player];
        
        UILabel *score = [[UILabel alloc]init];
        [score setText:scoreValue];
        score.textColor = [UIColor whiteColor];
        score.frame = CGRectMake(120, 100 + enter, 90, 30);
        [self.view addSubview:score];
        
        enter = enter + 30;
    }
    
    
}

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
