//
//  HighscoreScene.h
//  TheShellGame
//
//  Created by R Witsenburg on 18-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameManager.h"

@interface HighscoreScene : SKScene
{
    UILabel *name;
    UILabel *score;
}
@property (nonatomic) UIButton *backButton;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *score;

@end
