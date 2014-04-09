//
//  OptionsScene.h
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameManager.h"

@interface OptionsScene : SKScene

@property (nonatomic, retain) UIButton* backButton;
@property (strong, nonatomic) UISlider *sliderAmountOfCups;
@property (strong, nonatomic) UISlider *sliderAmountOfBalls;

@property (nonatomic) UILabel *cups;
@property (nonatomic) UILabel *balls;

@end
