//
//  OptionsScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "OptionsScene.h"
#import "MenuScene.h"

@implementation OptionsScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    _cups = [[UILabel alloc]init];
    [_cups setText:@"Amount of cups:"];
    _cups.font = [UIFont fontWithName:@"Chalkduster" size:36];
    _cups.textColor = [UIColor whiteColor];
    _cups.frame = CGRectMake(150, 400, 400, 50);
    [self.view addSubview:_cups];
    
    _balls = [[UILabel alloc]init];
    [_balls setText:@"Amount of balls:"];
    _balls.font = [UIFont fontWithName:@"Chalkduster" size:36];
    _balls.textColor = [UIColor whiteColor];
    _balls.frame = CGRectMake(150, 330, 400, 50);
    [self.view addSubview:_balls];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 200, 70.0);
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_backButton addTarget:self action:@selector(moveToHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    _sliderAmountOfBalls = [[UISlider alloc] initWithFrame:CGRectMake(550, 360, 130.0, 5.0)];
    [_sliderAmountOfBalls addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [_sliderAmountOfBalls setBackgroundColor:[UIColor clearColor]];
    _sliderAmountOfBalls.minimumValue = 1;
    _sliderAmountOfBalls.maximumValue = 3;
    _sliderAmountOfBalls.continuous = YES;
    _sliderAmountOfBalls.value = 1;
    [self.view addSubview:_sliderAmountOfBalls];
    
    _sliderAmountOfCups = [[UISlider alloc] initWithFrame:CGRectMake(550, 430, 130.0, 5.0)];
    [_sliderAmountOfCups addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [_sliderAmountOfCups setBackgroundColor:[UIColor clearColor]];
    _sliderAmountOfCups.minimumValue = 1;
    _sliderAmountOfCups.maximumValue = 5;
    _sliderAmountOfCups.continuous = YES;
    _sliderAmountOfCups.value = 3;
    [self.view addSubview:_sliderAmountOfCups];
}

-(void)sliderAction
{
    
    _resetLabel = [[UIView alloc]init];
    [_resetLabel setBackgroundColor:[UIColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0]];
    _resetLabel.frame = CGRectMake(700, 345, 20, 30);
    [self.view addSubview:_resetLabel];
    
    //-- Do further actions
    _currentValueBalls = [[UILabel alloc]init];
    NSString *sliderValue = [NSString stringWithFormat:@"%d",(int)_sliderAmountOfBalls.value];
    [_currentValueBalls setText:sliderValue];
    _currentValueBalls.textColor = [UIColor whiteColor];
    _currentValueBalls.frame = CGRectMake(700, 345, 20, 30);
    [self.view addSubview:_currentValueBalls];
    
    _resetLabel2 = [[UIView alloc]init];
    [_resetLabel2 setBackgroundColor:[UIColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0]];
    _resetLabel2.frame = CGRectMake(700, 415, 20, 30);
    [self.view addSubview:_resetLabel2];
    
    _currentValueCups = [[UILabel alloc]init];
    //currentValue.text = @"";
    NSString *sliderValue2 = [NSString stringWithFormat:@"%d",(int)_sliderAmountOfCups.value];
    [_currentValueCups setText:sliderValue2];
    _currentValueCups.textColor = [UIColor whiteColor];
    _currentValueCups.frame = CGRectMake(700, 415, 20, 30);
    [self.view addSubview:_currentValueCups];

}


-(void) moveToHome{
    //save settings
    int sliderValueBalls = (int) _sliderAmountOfBalls.value;
    [[GameManager sharedManager] setAmountOfBalls:sliderValueBalls];

    NSLog(@"amount of ball: %d",[[GameManager sharedManager] amountOfBalls]);
    MenuScene* menuScene = [[MenuScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [_cups removeFromSuperview];
    [_balls removeFromSuperview];
    
    [_currentValueBalls removeFromSuperview];
    [_currentValueCups removeFromSuperview];
    
    [_backButton removeFromSuperview];
    [_sliderAmountOfBalls removeFromSuperview];
    [_sliderAmountOfCups removeFromSuperview];
    [self.scene.view presentScene:menuScene];
}

@end
