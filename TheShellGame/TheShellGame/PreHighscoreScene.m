//
//  PreHighscoreScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 18-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "PreHighscoreScene.h"
#import "HighscoreScene.h"

@implementation PreHighscoreScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    _playername = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-120, 150, 30)];
    _playername.backgroundColor = [UIColor whiteColor];
    _playername.placeholder = @"Player";
    [self.view addSubview:_playername];
    
    _scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-60, 130, 25)];
    _scoreLabel.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_scoreLabel setTextColor:[UIColor whiteColor]];
    int gamescore = [[GameManager sharedManager] gameScore];
    NSString *textscore = [NSString stringWithFormat:@"%i",gamescore];
    _scoreLabel.text = textscore;
    [self.view addSubview:_scoreLabel];
    
    _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 130, 25)];
    _nextButton.backgroundColor = [UIColor clearColor];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
    _nextButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_nextButton addTarget:self action:@selector(goToHighscore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void) goToHighscore{
    //save settings
    NSString *value = [_playername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if([value length] == 0) {
        // Alert the user they forgot something
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Playername"
                                                        message:@"The playername cannot be empty."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        [[GameManager sharedManager] setPlayer:_playername.text];
    
        [_playername removeFromSuperview];
        [_scoreLabel removeFromSuperview];
        [_nextButton removeFromSuperview];
    
        [[GameManager sharedManager] insertHighscoreInDB];
        HighscoreScene* highscoreScene = [[HighscoreScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:highscoreScene];
    }
}

@end
