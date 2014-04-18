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
    [self.view setBackgroundColor:[UIColor colorWithRed:34.0f/255.0f green:139.0f/255.0f blue:34.0f/255.0f alpha:1.0]];

    
    
    /*message.alertViewStyle = UIAlertViewStylePlainTextInput;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Rate on the Appstore!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Later"
                                          otherButtonTitles:@"OK", nil];
    [alert show];*/
    
    [self loadHighscore];
    [[GameManager sharedManager] resetGameManager];
}

- (void) loadHighscore
{
    
    NSDictionary *plistRead = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    
    NSArray *arrayRead = [plistRead objectForKey:@"data"];
    NSString *playerName;
    NSString *scoreValue;
    int enter = 0;
    int max = 0;
    NSLog(@"array for view: %@",arrayRead);
    NSLog(@"count %i",arrayRead.count);
    for(int y = 0; y <arrayRead.count; y++)
    {
            NSLog(@"score: %@", arrayRead[y]);
            scoreValue = [NSString stringWithFormat:@"%@",arrayRead[y]];
            NSLog(@"player: %@", arrayRead[y++]);
            playerName = [NSString stringWithFormat:@"%@",arrayRead[y]];
        
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
        max++;
        if(max==9){
            break;
        }
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
