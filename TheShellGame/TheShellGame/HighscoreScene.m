//
//  HighscoreScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 18-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "HighscoreScene.h"
#import "MenuScene.h"

@implementation HighscoreScene

@synthesize score;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    NSArray *scores;
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(80, 70, 50, 50);
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_backButton setTitle:@"<-" forState:UIControlStateNormal];
    _backButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_backButton addTarget:self action:@selector(moveToHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];

    
    if(![[GameManager sharedManager] connectedToInternet]){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        scores = [defaults objectForKey:@"offlineHighScoresShellGame"];
    }
    else{
        scores = [[GameManager sharedManager] arrayScore];
        int y = 0;
        
        
        
        for(int x = 0; x <scores.count; x++){
            if((x%2)==0){
                name = [[UILabel alloc] init];
                NSString *playername = scores[x];
                [name setText:playername];
                name.font = [UIFont fontWithName:@"Chalkduster" size:36];
                name.textColor = [UIColor whiteColor];
                name.frame = CGRectMake(150, 100 + y, 400, 50);
                [self.view addSubview:name];
            
            }
            else{
                score = [[UILabel alloc]init];
                NSString *playerscore = scores[x];
                [score setText:playerscore];
                score.font = [UIFont fontWithName:@"Chalkduster" size:36];
                score.textColor = [UIColor whiteColor];
                score.frame = CGRectMake(600, 100 + y, 400, 50);
                [self.view addSubview:score];
                y = y+50;
            }
        
        }
    }
}


-(void) moveToHome{
    MenuScene* menuScene = [[MenuScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    
    [_backButton removeFromSuperview];
    [self.view.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    //[self.view removeFromSuperview];
    
    [[GameManager sharedManager] resetGameManager];
    [self.scene.view presentScene:menuScene];
}

@end
