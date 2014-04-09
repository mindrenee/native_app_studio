//
//  GameManager.h
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject{
    int score;
    int amountOfCups;
    int amountOfBalls;
}

+ (id)sharedManager;

@property (nonatomic) int score;
@property (nonatomic) int amountOfCups;
@property (nonatomic) int amountOfBalls;

@end
