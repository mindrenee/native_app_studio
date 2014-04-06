//
//  MyScene.m
//  TheShellGame
//
//  Created by R Witsenburg on 05-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "MyScene.h"

@interface MyScene()

@property (nonatomic) SKSpriteNode* cup1;
@property (nonatomic) SKSpriteNode* cup2;
@property (nonatomic) SKSpriteNode* cup3;

@end

@implementation MyScene

- (void)addCups:(CGSize)size {
    //create first cup
    self.cup1 = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 200)];
    //[SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
    CGPoint point1 = CGPointMake(size.width/2, size.height/2);
    self.cup1.position = point1;
    self.cup1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.cup1.frame.size];
    
    //cup 2
    self.cup2 = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(100, 200)];
    //[SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
    CGPoint point2 = CGPointMake(size.width/2 - 200, size.height/2 );
    self.cup2.position = point2;
    self.cup2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.cup2.frame.size];

    
    self.cup3 = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(100, 200)];
    //[SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
    CGPoint point3 = CGPointMake(size.width/2 + 200, size.height/2 );
    self.cup3.position = point3;
    self.cup3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.cup3.frame.size];

    [self addChild:self.cup1];
    [self addChild:self.cup2];
    [self addChild:self.cup3];
}

-(void)moveCups {
    SKAction *moveUp = [SKAction moveByX:0 y:100 duration:1.5];
    SKAction *moveDown = [moveUp reversedAction];
    
    SKAction *moveUpAndDown = [SKAction sequence:@[moveUp,moveDown]];
    
    [self.cup1 runAction:moveUpAndDown];
    
    
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1.0];
        
        //change gravity
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        [self addCups:size];
        [self moveCups];
        
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
