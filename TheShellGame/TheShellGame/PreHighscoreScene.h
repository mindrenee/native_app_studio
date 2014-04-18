//
//  PreHighscoreScene.h
//  TheShellGame
//
//  Created by R Witsenburg on 18-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameManager.h"

@interface PreHighscoreScene : SKScene

@property (nonatomic, retain) UIButton* nextButton;
@property (nonatomic) UILabel *scoreLabel;
@property (nonatomic) UITextField *playername;

@end
