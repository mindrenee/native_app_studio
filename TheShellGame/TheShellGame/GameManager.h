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
    int gameScore;
    int amountOfCups;
    int amountOfBalls;
    NSString *player;
    NSMutableArray *cups;
    NSMutableArray *balls;
    NSArray *arrayScore;
    NSMutableArray *notUploadedHighscores;
}

- (void) insertHighscoreInDB;
- (void) getOnlineHighscore;
- (void) syncToPList;
- (void) highScoresToUpload;
- (BOOL) connectedToInternet;

+ (id)sharedManager;

@property (nonatomic) int gameScore;
@property (nonatomic) int amountOfCups;
@property (nonatomic) int amountOfBalls;
@property (nonatomic) NSString *player;
@property (nonatomic) NSArray *arrayScore;
@property (nonatomic, strong) NSMutableArray *cups;
@property (nonatomic, strong) NSMutableArray *balls;
@property (nonatomic, strong) NSMutableArray *notUploadedHighscores;

@end
