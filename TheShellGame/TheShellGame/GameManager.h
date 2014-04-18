//
//  GameManager.h
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface GameManager : NSObject{
    int score;
    int amountOfCups;
    int amountOfBalls;
    NSString *player;
    NSMutableArray *cups;
}

+ (id)sharedManager;

@property (nonatomic) int score;
@property (nonatomic) int amountOfCups;
@property (nonatomic) int amountOfBalls;
@property (nonatomic) NSString *player;
@property (nonatomic, strong) NSMutableArray *cups;

@end
