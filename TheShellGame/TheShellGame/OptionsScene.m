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
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 200, 70.0);
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_backButton addTarget:self action:@selector(moveToHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    _sliderAmountOfBalls = [[UISlider alloc] initWithFrame:CGRectMake(150, 265, 130.0, 5.0)];
    [_sliderAmountOfBalls addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [_sliderAmountOfBalls setBackgroundColor:[UIColor clearColor]];
    _sliderAmountOfBalls.minimumValue = 1;
    _sliderAmountOfBalls.maximumValue = 12;
    _sliderAmountOfBalls.continuous = YES;
    _sliderAmountOfBalls.value = 1;
    [self.view addSubview:_sliderAmountOfBalls];
    
    _sliderAmountOfCups = [[UISlider alloc] initWithFrame:CGRectMake(150, 305, 130.0, 5.0)];
    [_sliderAmountOfCups addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [_sliderAmountOfCups setBackgroundColor:[UIColor clearColor]];
    _sliderAmountOfCups.minimumValue = 1;
    _sliderAmountOfCups.maximumValue = 12;
    _sliderAmountOfCups.continuous = YES;
    _sliderAmountOfCups.value = 1;
    [self.view addSubview:_sliderAmountOfCups];
}

-(void)sliderAction
{
    
    UIView *resetLabel = [[UIView alloc]init];
    [resetLabel setBackgroundColor:[UIColor colorWithRed:34.0f/255.0f green:139.0f/255.0f blue:34.0f/255.0f alpha:1.0]];
    resetLabel.frame = CGRectMake(290, 250, 20, 30);
    [self.view addSubview:resetLabel];
    
    //-- Do further actions
    //NSLog(@"Slider value %f", _slider.value);
    UILabel *currentValue = [[UILabel alloc]init];
    //currentValue.text = @"";
    NSString *sliderValue = [NSString stringWithFormat:@"%d",(int)_sliderAmountOfBalls.value];
    [currentValue setText:sliderValue];
    currentValue.textColor = [UIColor whiteColor];
    currentValue.frame = CGRectMake(290, 250, 20, 30);
    [self.view addSubview:currentValue];
    
    
}


-(void) moveToHome{
    
    //save settings
    int sliderValue = (int) _sliderAmountOfBalls.value;
    //[[GameManager sharedManager] setAmountOfBalls:sliderValue];

    
    MenuScene* menuScene = [[MenuScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [_backButton removeFromSuperview];
    [_sliderAmountOfBalls removeFromSuperview];
    [_sliderAmountOfCups removeFromSuperview];
    [self.scene.view presentScene:menuScene];
}

@end
