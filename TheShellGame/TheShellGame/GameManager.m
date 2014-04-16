//
//  GameManager.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize score;
@synthesize amountOfBalls;
@synthesize amountOfCups;
@synthesize cups;

+ (id)sharedManager {
    static GameManager *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}


- (id)init {
    if (self = [super init]) {
        //[self loadWord:lengthWord];
        [self setAmountOfBalls:1];
        [self setAmountOfCups:3];
        [self setScore:0];
        cups = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void) setAmountOfBalls:(int)amountOfBallsNew{
    amountOfBalls = amountOfBallsNew;
}

- (void) setAmountOfCups:(int)amountOfCupsNew{
    amountOfCups = amountOfCupsNew;
    [self createCups];
}

- (void) setScore:(int)scoreNew{
    score = scoreNew;
}

- (void) createCups{
    if (!cups) cups = [[NSMutableArray alloc] init];
    for(int i; i<amountOfCups; i++){
        SKSpriteNode *cup = [SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
        //[SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 200)];
        CGPoint point1 = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
        cup.position = point1;
        cup.name = @"cup";
        cup.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:cup.frame.size];
        cup.physicsBody.dynamic = NO;
        [self.cups addObject:cup];
    }
    [cups addObject:@"Hallo?"];
    NSLog(@"cups: %@",self.cups[0]);
    for (id cup in self.cups) {
        NSLog(@"%@", cup);
    }
}

- (void) resetGameManager
{
    // reset the variabeles of the Singleton
    [self setScore:0];
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
