//
//  GameScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 05-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameScene.h"
#import "PreHighscoreScene.h"
#import "MenuScene.h"

@interface GameScene()

@property (nonatomic) SKSpriteNode* ball;

@end

@implementation GameScene

@synthesize scoreLabel;

- (void)addSprites:(CGSize)size {
    
    // Score Label
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", [[GameManager sharedManager] gameScore]];
    scoreLabel.fontSize = 36;
    scoreLabel.position = CGPointMake(600, 900);
    [self addChild:scoreLabel];
    
    //create arrays to hold positions and access sprites to movement
    _cupsToHold = [[NSMutableArray alloc] initWithCapacity:[[GameManager sharedManager] amountOfCups]];
    _ballsTohold = [[NSMutableArray alloc] initWithCapacity:[[GameManager sharedManager] amountOfBalls]];
    
    //create balls from array
    NSMutableArray *balls = [[GameManager sharedManager] balls];
    SKSpriteNode *addedBall;
    for (id ball in balls) {
        [self addChild:ball];
        addedBall = ball;
        [_ballsTohold addObject:addedBall];
    }
    
    //create cups from array
    NSMutableArray *cups = [[GameManager sharedManager] cups];
    SKSpriteNode *addedCup;
    for (id cup in cups) {
        [self addChild:cup];
        addedCup = cup;
        [_cupsToHold addObject:addedCup];
    }
    
    // als er een pingpongbal onder het blik zit til het dan op
    SKAction *moveUp = [SKAction moveByX:0 y:100 duration:1.0];
    SKAction *moveDown = [moveUp reversedAction];
    SKAction *moveUpAndDown = [SKAction sequence:@[moveUp,moveDown]];
    if(_ballsTohold.count == 1){
        [_cupsToHold[0] runAction:moveUpAndDown completion:^{NSLog(@"start");}];
    }
    else{ //2 ballen aanwezig
        [_cupsToHold[0] runAction:moveUpAndDown];
        [_cupsToHold[1] runAction:moveUpAndDown];
    }
    
}

-(void)moveCups {
    
    float time = 0.6;
    
    if([[GameManager sharedManager] gameScore] > 3){
        time = time-0.1;
    }
    if([[GameManager sharedManager] gameScore] >= 7){
        time = time+0.1;
    }
    // for 3 cans
    SKAction *moveOnePosToRight = [SKAction moveByX:150 y:0 duration:time];
    SKAction *moveTw0PosToRight = [SKAction moveByX:300 y:0 duration:time];
    SKAction *moveOnePosToLeft = [SKAction moveByX:-150 y:0 duration:time];
    SKAction *moveTwoPosToLeft = [SKAction moveByX:-300 y:0 duration:time];
    
    //for 4 cans
    SKAction *moveThreePosToRight = [SKAction moveByX:450 y:0 duration:time];
    SKAction *moveThreePosToLeft = [SKAction moveByX:-450 y:0 duration:time];
    
    //for 5 cans
    SKAction *moveFourPosToRight = [SKAction moveByX:600 y:0 duration:time];
    SKAction *moveFourPosToLeft = [SKAction moveByX:-600 y:0 duration:time];
    
    //[0] kan in ieder geval [1] kan in ieder geval [2] kan in geval van 4 blikjes [3] kan in geval van 5 blikjes
    NSArray *movementsMostLeft = @[moveOnePosToRight, moveTw0PosToRight, moveThreePosToRight, moveFourPosToRight];
    NSArray *movementsPos2 = @[moveOnePosToRight, moveOnePosToLeft, moveTw0PosToRight, moveThreePosToRight];
    NSArray *movementsPos3 = @[moveTwoPosToLeft, moveOnePosToLeft, moveOnePosToRight, moveTw0PosToRight];
    NSArray *movementsPos4 = @[moveOnePosToLeft, moveTwoPosToLeft, moveThreePosToLeft, moveOnePosToRight];
    NSArray *movementsPos5 = @[moveThreePosToLeft, moveTwoPosToLeft, moveThreePosToLeft, moveFourPosToLeft];
    
    SKAction *wait = [SKAction waitForDuration:2];
    
    NSInteger randomNumber;
    if([[GameManager sharedManager] amountOfCups] == 3){
        randomNumber = arc4random() % 2;
    }
    else if ([[GameManager sharedManager] amountOfCups] == 4){
        randomNumber = arc4random() % 3;
    }
    else{
        randomNumber = arc4random() % 4;
    }
    NSLog(@"randomnummer: %i", randomNumber);
    
    
    // 3 blikjes
    if([[GameManager sharedManager] amountOfCups] == 3){
        NSLog(@"Gamescore Lalalaa: %i", [[GameManager sharedManager] gameScore]);
        if([[GameManager sharedManager] gameScore] == 0 || [[GameManager sharedManager] gameScore] == 3 || [[GameManager sharedManager] gameScore] == 6 || [[GameManager sharedManager] gameScore] == 9){
        randomNumber = 0;
        SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber]]];
        SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber]]];
        SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber]]];
        
        [_cupsToHold[0] runAction:startmovePos1];
        [_ballsTohold[0] runAction:startmovePos1];
        [_cupsToHold[1] runAction:startmovePos2];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos2];
            }
        [_cupsToHold[2] runAction:startmovePos3];
        }
        else if([[GameManager sharedManager] gameScore] == 1 || [[GameManager sharedManager] gameScore] == 4 || [[GameManager sharedManager] gameScore] == 7 || [[GameManager sharedManager] gameScore] == 10){
            randomNumber = 1;
            SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos3[randomNumber], movementsPos2[randomNumber], movementsMostLeft[randomNumber], movementsPos3[randomNumber], movementsPos2[randomNumber]]];
            SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsMostLeft[randomNumber]]];
            SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber], movementsPos2[randomNumber], movementsMostLeft[randomNumber], movementsPos3[randomNumber]]];
            
            [_cupsToHold[0] runAction:startmovePos2];
            [_ballsTohold[0] runAction:startmovePos2];
            [_cupsToHold[1] runAction:startmovePos3];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos3];
            }
            [_cupsToHold[2] runAction:startmovePos1];
        }
        else if([[GameManager sharedManager] gameScore] == 2 || [[GameManager sharedManager] gameScore] == 5 || [[GameManager sharedManager] gameScore] == 8 || [[GameManager sharedManager] gameScore] == 11){
            randomNumber = 0;
            SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber]]];
            SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber]]];
            SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber]]];
            
            [_cupsToHold[0] runAction:startmovePos3];
            [_ballsTohold[0] runAction:startmovePos3];
            [_cupsToHold[1] runAction:startmovePos2];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos2];
            }
            [_cupsToHold[2] runAction:startmovePos1];
            
        }
    }
    
    // 4 blikjes!
    else if([[GameManager sharedManager] amountOfCups] == 4 && [[GameManager sharedManager] amountOfBalls] == 1){
        if([[GameManager sharedManager] gameScore] == 0 || [[GameManager sharedManager] gameScore] == 3 || [[GameManager sharedManager] gameScore] == 6 || [[GameManager sharedManager] gameScore] == 9){
            randomNumber = 2;
            int randomNumber2 = 1;
            SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos4[randomNumber], movementsMostLeft[randomNumber]]];
            SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber2], movementsMostLeft[randomNumber2], movementsPos3[randomNumber2], movementsPos2[randomNumber2], movementsMostLeft[randomNumber2]]];
            SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber2], movementsPos2[randomNumber2], movementsMostLeft[randomNumber2], movementsPos3[randomNumber2]]];
            SKAction *startmovePos4 = [SKAction sequence:@[wait, movementsPos4[randomNumber], movementsMostLeft[randomNumber], movementsPos4[randomNumber]]];
        
        [_cupsToHold[0] runAction:startmovePos1];
        [_ballsTohold[0] runAction:startmovePos1];
        [_cupsToHold[1] runAction:startmovePos2];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos2];
            }
        [_cupsToHold[2] runAction:startmovePos3];
        [_cupsToHold[3] runAction:startmovePos4];
        }
        else if([[GameManager sharedManager] gameScore] == 1 || [[GameManager sharedManager] gameScore] == 4 || [[GameManager sharedManager] gameScore] == 7 || [[GameManager sharedManager] gameScore] == 10){
            randomNumber = 1;
            SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos3[randomNumber], movementsPos2[randomNumber]]];
            SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsMostLeft[randomNumber], movementsPos3[2]]];
            SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber], movementsPos2[randomNumber], movementsMostLeft[randomNumber]]];
            SKAction *startmovePos4 = [SKAction sequence:@[wait, movementsPos4[randomNumber], movementsPos2[randomNumber], movementsMostLeft[randomNumber]]];
            
            [_cupsToHold[0] runAction:startmovePos4];
            [_ballsTohold[0] runAction:startmovePos4];
            [_cupsToHold[1] runAction:startmovePos2];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos2];
            }
            [_cupsToHold[2] runAction:startmovePos3];
            [_cupsToHold[3] runAction:startmovePos1];
        }
        else if([[GameManager sharedManager] gameScore] == 2 || [[GameManager sharedManager] gameScore] == 5 || [[GameManager sharedManager] gameScore] == 8 || [[GameManager sharedManager] gameScore] == 11){
            randomNumber = 0;
            SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[2]]];
            SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber]]];
            SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber]]];
            SKAction *startmovePos4 = [SKAction sequence:@[wait, movementsPos4[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber]]];
            
            [_cupsToHold[0] runAction:startmovePos3];
            [_ballsTohold[0] runAction:startmovePos3];
            [_cupsToHold[1] runAction:startmovePos4];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos4];
            }
            [_cupsToHold[2] runAction:startmovePos2];
            [_cupsToHold[3] runAction:startmovePos1];
        }
        
    }
    
    // 5 blikjes
    else if([[GameManager sharedManager] amountOfCups] == 5){
        
        randomNumber = 0;
        
        SKAction *startmovePos1 = [SKAction sequence:@[wait, movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber]]];
        SKAction *startmovePos2 = [SKAction sequence:@[wait, movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[2], movementsPos4[3]]];
        SKAction *startmovePos3 = [SKAction sequence:@[wait, movementsPos3[randomNumber], movementsMostLeft[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[2]]];
        SKAction *startmovePos4 = [SKAction sequence:@[wait, movementsPos4[randomNumber]]];
        SKAction *startmovePos5 = [SKAction sequence:@[wait, movementsPos5[randomNumber], movementsPos2[randomNumber], movementsPos3[randomNumber], movementsMostLeft[randomNumber]]];
        
        if([[GameManager sharedManager] gameScore] == 0 || [[GameManager sharedManager] gameScore] == 2 || [[GameManager sharedManager] gameScore] == 4 || [[GameManager sharedManager] gameScore] == 6 || [[GameManager sharedManager] gameScore] == 8 || [[GameManager sharedManager] gameScore] == 10){
            
            [_cupsToHold[0] runAction:startmovePos1];
            [_ballsTohold[0] runAction:startmovePos1];
            [_cupsToHold[1] runAction:startmovePos2];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos2];
            }
            [_cupsToHold[2] runAction:startmovePos3];
            [_cupsToHold[3] runAction:startmovePos4];
            [_cupsToHold[4] runAction:startmovePos5];
            
        }
        else if([[GameManager sharedManager] gameScore] == 1 || [[GameManager sharedManager] gameScore] == 3 || [[GameManager sharedManager] gameScore] == 5 || [[GameManager sharedManager] gameScore] == 7 || [[GameManager sharedManager] gameScore] == 9 || [[GameManager sharedManager] gameScore] == 11){
            
            [_cupsToHold[0] runAction:startmovePos1];
            [_ballsTohold[0] runAction:startmovePos1];
            [_cupsToHold[1] runAction:startmovePos5];
            if([[GameManager sharedManager] amountOfBalls] == 2){
                [_ballsTohold[1] runAction:startmovePos5];
            }
            [_cupsToHold[2] runAction:startmovePos4];
            [_cupsToHold[3] runAction:startmovePos3];
            [_cupsToHold[4] runAction:startmovePos2];
        }
        
        
    }
    
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // guessed all balls is game?
    int guessed = 0;
    
    SKAction *moveUp = [SKAction moveByX:0 y:100 duration:1];
    SKAction *moveDown = [moveUp reversedAction];
    SKAction *wait = [SKAction waitForDuration:0.1];
    SKAction *moveUpAndDown = [SKAction sequence:@[moveUp,moveDown, wait]];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    PreHighscoreScene* highscoreScene = [[PreHighscoreScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    
    //check if guessed cans are the right one
    NSLog(@"node name: %@",node.name);
    NSLog(@"node position: %i",(int)node.position.x);
    
    if ([node.name isEqualToString:@"cup0"]) {
        //do whatever...
        [node runAction:moveUpAndDown];
        NSLog(@"Right");
        guessed++;
        int score = [[GameManager sharedManager] gameScore];
        [[GameManager sharedManager] setGameScore:score+1];
        [self moveCups];
        
    }
    else if ([node.name isEqualToString:@"cup1"]) {
        [node runAction:moveUpAndDown];
        if([[GameManager sharedManager] amountOfBalls] == 1){
            NSLog(@"Wrong");
            [_backButton removeFromSuperview];
            [self.scene.view presentScene:highscoreScene];
        }
        else{
            NSLog(@"Right");
            guessed++;
            int score = [[GameManager sharedManager] gameScore];
            [[GameManager sharedManager] setGameScore:score+1];
            [self moveCups];
        }
    }
    else if ([node.name isEqualToString:@"cup2"]) {
        [node runAction:moveUpAndDown];
        NSLog(@"Wrong");
        [_backButton removeFromSuperview];
        [self.scene.view presentScene:highscoreScene];
    }
    else if ([node.name isEqualToString:@"cup3"]) {
        [node runAction:moveUpAndDown];
        NSLog(@"Wrong");
        [_backButton removeFromSuperview];
        [self.scene.view presentScene:highscoreScene];
    }
    else if ([node.name isEqualToString:@"cup4"]) {
        [node runAction:moveUpAndDown];
        NSLog(@"Wrong");
        [_backButton removeFromSuperview];
        [self.scene.view presentScene:highscoreScene];
    }
    
    if([[GameManager sharedManager] gameScore] == 12){
        [_backButton removeFromSuperview];
        [self.scene.view presentScene:highscoreScene];
    }

}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        //change gravity
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        [self addSprites:size];
        [self moveCups];
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(80, 70, 50, 50);
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_backButton setTitle:@"<-" forState:UIControlStateNormal];
    _backButton.font = [UIFont fontWithName:@"Chalkduster" size:36];
    [_backButton addTarget:self action:@selector(moveToHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}

-(void) moveToHome{
    MenuScene* menuScene = [[MenuScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];

    [_backButton removeFromSuperview];
    
    [self.scene.view presentScene:menuScene];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", [[GameManager sharedManager] gameScore]];
    
    //posities van sprites bijhouden?
    
    
}

@end
