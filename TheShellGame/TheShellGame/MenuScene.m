//
//  MenuScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"
#import "OptionsScene.h"
#import "HighscoreScene.h"

@implementation MenuScene {
    UIButton *startButton;
    UIButton *optionsButton;
    UIButton *exitButton;
    UIButton *highscoreButton;
    UILabel *title;
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];

    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    title = [[UILabel alloc] init];
    title.font = [UIFont fontWithName:@"Chalkduster" size:36] ;
                //[UIColor whiteColor];
    title.text = @"The Shell Game";
    title.textColor = [UIColor whiteColor];
    title.frame = CGRectMake(CGRectGetMidX(self.frame)-75, CGRectGetMidY(self.frame)-200,400 ,70);
    [self.view addSubview:title];
    
    startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-100, 200, 70.0);
    startButton.backgroundColor = [UIColor clearColor];
    startButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(moveToGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];

    optionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    optionsButton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-50, 200, 70.0);
    optionsButton.backgroundColor = [UIColor clearColor];
    optionsButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [optionsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [optionsButton setTitle:@"Options" forState:UIControlStateNormal];
    [optionsButton addTarget:self action:@selector(moveToOptions) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:optionsButton];
    
    highscoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    highscoreButton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 200, 70.0);
    highscoreButton.backgroundColor = [UIColor clearColor];
    highscoreButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [highscoreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [highscoreButton setTitle:@"Highscore" forState:UIControlStateNormal];
    [highscoreButton addTarget:self action:@selector(moveToHighScore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:highscoreButton];

}

-(void) moveToGame{
    NSLog(@"moveToGame");
    GameScene* gameScene = [[GameScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    SKTransition* transition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1];
    [title removeFromSuperview];
    [startButton removeFromSuperview];
    [optionsButton removeFromSuperview];
    [exitButton removeFromSuperview];
    [highscoreButton removeFromSuperview];
    [self.scene.view presentScene:gameScene transition:transition];
}

-(void) moveToOptions{
    NSLog(@"moveToOptions");
    OptionsScene* optionsScene = [[OptionsScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    SKTransition* transition = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:1];
    [title removeFromSuperview];
    [startButton removeFromSuperview];
    [optionsButton removeFromSuperview];
    [exitButton removeFromSuperview];
    [highscoreButton removeFromSuperview];
    [self.scene.view presentScene:optionsScene transition:transition];
}

-(void) moveToHighScore{
    NSLog(@"moveToHighscore");
    HighscoreScene* highscoreScene = [[HighscoreScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    SKTransition* transition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1];
    [title removeFromSuperview];
    [startButton removeFromSuperview];
    [optionsButton removeFromSuperview];
    [exitButton removeFromSuperview];
    [highscoreButton removeFromSuperview];
    [self.scene.view presentScene:highscoreScene transition:transition];
}

@end