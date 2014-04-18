//
//  MyScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 05-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "MyScene.h"

@interface MyScene()

@property (nonatomic) SKSpriteNode* ball;
@property (nonatomic) SKLabelNode* scoreLabel;

@end

@implementation MyScene

- (void)addSprites:(CGSize)size {
    
    
    
    //first add pingpongballs
    self.ball = [SKSpriteNode spriteNodeWithImageNamed:@"pingpongbal"];
    //[SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(100, 200)];
    CGPoint point4 = CGPointMake(size.width/2, size.height/2 - 75);
    self.ball.position = point4;
    self.ball.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.ball.frame.size];
    self.ball.physicsBody.dynamic = NO;
    
    [self addChild:self.ball];
    
    //create cups from array
    NSMutableArray *cups = [[GameManager sharedManager] cups];
    for (id cup in cups) {
        [self addChild:cup];
    }

}

-(void)moveCups {
    SKAction *moveOnePosToRight = [SKAction moveByX:200 y:0 duration:1];
    SKAction *moveTw0PosToRight = [SKAction moveByX:400 y:0 duration:1];
    SKAction *moveOnePosToLeft = [SKAction moveByX:-200 y:0 duration:1];
    SKAction *moveTwoPosToLeft = [SKAction moveByX:-400 y:0 duration:1];
    
    NSArray *setOfActions = @[moveOnePosToLeft, moveOnePosToRight, moveTwoPosToLeft, moveTw0PosToRight];
    
    SKAction *moveUp = [SKAction moveByX:0 y:100 duration:1.5];
    SKAction *moveDown = [moveUp reversedAction];
    
    SKAction *moveUpAndDown = [SKAction sequence:@[moveUp,moveDown]];
    
    SKAction *wait = [SKAction waitForDuration:3];
    
    //[self.cup1 runAction:moveUpAndDown];

    
    //middle cup
    SKAction *startMiddle = [SKAction sequence:@[moveUpAndDown,moveOnePosToRight, moveTwoPosToLeft]];
    //left cup
    SKAction *startLeft = [SKAction sequence:@[wait, moveOnePosToRight, moveOnePosToLeft, moveTw0PosToRight]];
    //right cup
    SKAction *startRight = [SKAction sequence:@[wait, moveTwoPosToLeft, moveOnePosToRight]];
    SKAction *startBall = [SKAction sequence:@[wait,moveOnePosToRight, moveTwoPosToLeft]];
    
    //random movements
    
    [self.ball runAction:startBall];
    //[self.cup1 runAction:startMiddle];
    //[self.cup2 runAction:startLeft];
    //[self.cup3 runAction:startRight];
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKAction *moveUp = [SKAction moveByX:0 y:100 duration:1.5];
    SKAction *moveDown = [moveUp reversedAction];
    
    SKAction *moveUpAndDown = [SKAction sequence:@[moveUp,moveDown]];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"cup1"]) {
        //do whatever...
        //[self.cup1 runAction:moveUpAndDown];
        NSLog(@"Right");
        int score = [[GameManager sharedManager] score];
        [[GameManager sharedManager] setScore:score+1];
    }
    else if ([node.name isEqualToString:@"cup2"]) {
        //[self.cup2 runAction:moveUpAndDown];
        NSLog(@"Wrong");
    }
    else if ([node.name isEqualToString:@"cup3"]) {
        //[self.cup3 runAction:moveUpAndDown];
        NSLog(@"Wrong");
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

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
