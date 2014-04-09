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
    }
    return self;
}

- (void) setAmountOfBalls:(int)amountOfBallsNew{
    amountOfBalls = amountOfBallsNew;
}

- (void) setAmountOfCups:(int)amountOfCupsNew{
    amountOfCups = amountOfCupsNew;
}

- (void) setScore:(int)scoreNew{
    score = scoreNew;
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
