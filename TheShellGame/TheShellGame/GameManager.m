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
        
    }
    return self;
}

- (void) resetGameManager
{
    // reset the variabeles of the Singleton

    
}

/*- (void) saveHighscoreInPlist
{
    
    //check earlier saved highscores
    NSDictionary *plistRead = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    NSArray *arrayRead = [plistRead objectForKey:@"data"];
    NSLog(@"count %i",arrayRead.count);
    NSLog(@"array highscore %@",arrayRead);
    
    NSMutableArray *myArrayToWrite = [NSMutableArray array];
    //[myArrayToWrite addObjectsFromArray:arrayRead];
    BOOL newSet = FALSE;
    int y;
    
    
    if(arrayRead.count == 0) {
        [myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
        [myArrayToWrite addObject:playername];
        newSet = TRUE;
    }
    if(newSet == FALSE){
        for(y = 0; y <arrayRead.count-1; y++){
            if(newSet == TRUE){
                [myArrayToWrite addObject:arrayRead[y]]; //score
                y++;
                [myArrayToWrite addObject:arrayRead[y]]; //player
            }
            else if(wrongGuessed < [arrayRead[y] integerValue])
            {
                [myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
                [myArrayToWrite addObject:playername];
                //[myArrayToWrite addObject:playername];
                newSet = TRUE;
                [myArrayToWrite addObject:arrayRead[y]]; //score
                y++;
                [myArrayToWrite addObject:arrayRead[y]]; //player
                
            }
            else
            {
                [myArrayToWrite addObject:arrayRead[y]]; //score
                y++;
                [myArrayToWrite addObject:arrayRead[y]]; //player
            }
            
        }
    }
    if(newSet == FALSE)
    {
        [myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
        [myArrayToWrite addObject:playername];
    }
    
    //NSLog(@"Save data to plist");
    //NSLog(@"%@", playername);
    //NSLog(@"%i", wrongGuessed);
    // to reset
    //[myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
    //[myArrayToWrite addObject:playername];
    
    NSMutableDictionary *plistToWrite = [NSMutableDictionary dictionary];
    [plistToWrite setObject:myArrayToWrite forKey:@"data"];
    
    [plistToWrite writeToFile:@"/Users/Shared/highscore.plist" atomically:NO];
    
    //--- LOG
    NSDictionary *plistRead2 = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    NSArray *arrayRead2 = [plistRead2 objectForKey:@"data"];
    NSLog(@"count %i",arrayRead2.count);
    NSLog(@"array highscore %@",arrayRead2);
}*/


- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
