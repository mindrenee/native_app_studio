//
//  MenuScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "MenuScene.h"
#import "MyScene.h"
#import "OptionsScene.h"

@implementation MenuScene {
    UIButton *startButton;
    UIButton *optionsButton;
    UIButton *exitButton;
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        SKLabelNode *title = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
        title.fontColor = [SKColor whiteColor];
        title.text = @"The Shell Game";
        title.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:title];

    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
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
}

-(void) moveToGame{
    NSLog(@"moveToGame");
    MyScene* gameScene = [[MyScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    SKTransition* transition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1];
    [startButton removeFromSuperview];
    [optionsButton removeFromSuperview];
    [exitButton removeFromSuperview];
    [self.scene.view presentScene:gameScene transition:transition];
}

-(void) moveToOptions{
    NSLog(@"moveToOptions");
    OptionsScene* optionsScene = [[OptionsScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    SKTransition* transition = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:1];
    [startButton removeFromSuperview];
    [optionsButton removeFromSuperview];
    [exitButton removeFromSuperview];
    [self.scene.view presentScene:optionsScene transition:transition];
}

@end