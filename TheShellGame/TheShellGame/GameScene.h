//
//  GameScene.h
//  TheShellGame
//

//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameManager.h"

@interface GameScene : SKScene

@property (nonatomic,strong) SKLabelNode *scoreLabel;
@property (nonatomic) UIButton *backButton;
@property (nonatomic, strong) NSMutableArray *cupsToHold;
@property (nonatomic, strong) NSMutableArray *ballsTohold;
@property (nonatomic, strong) NSMutableArray *cupsToHoldCopy;

@end
