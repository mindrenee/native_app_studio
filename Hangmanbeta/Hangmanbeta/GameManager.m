//
//  GameManager.m
//  Hangmanbeta
//
//  Created by R Witsenburg on 08-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize playername;
@synthesize lengthWord;
@synthesize word;
@synthesize wrongGuessed;
@synthesize guessNr;
//@synthesize highscore;
@synthesize score;

#pragma mark Singleton Methods

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
        [self loadWord:lengthWord];
        [self loadPlist];
        [self setPlayername:@"Player"];
    }
    return self;
}

- (void)loadWord: (int)wordLength  {
    NSString * wordToBeGuessed = [self loadFile: wordLength];
    word = [wordToBeGuessed uppercaseString];
    
}

- (void)setPlayername:(NSString *)playerName
{
    playername = playerName;
    
}


- (void)setWordLength: (int) length
{
    lengthWord = length;
    //NSLog(@"%d",lengthWord);
   
    [self loadWord:lengthWord];
}

- (void) loadPlist
{
    NSLog(@"load plist");
    NSURL* url = [[NSBundle mainBundle] URLForResource: @"words" withExtension: @"plist"];
    NSArray* myArray = [NSArray arrayWithContentsOfURL: url];
    NSLog(@"%lu", myArray.count);
    int x = 4;
    NSLog(@"%@", [myArray objectAtIndex:x]);
    NSLog(@"%lu", (unsigned long)[[myArray objectAtIndex:x]length]);
    
    //En schrijf weg in words(x).txt
    

}

- (NSString*) loadFile: (int) lenghtWord
{
    
    //NSString *file = [NSString stringWithFormat: @"words%d.", lenghtWord];
    //NSLog(@"open file %@", file);
    NSString *filepath;
    
    switch (lengthWord) {
        case 3:
            filepath = [[NSBundle mainBundle] pathForResource:@"words3" ofType:@"txt"];
            break;
        case 4:
            filepath = [[NSBundle mainBundle] pathForResource:@"words4" ofType:@"txt"];
            break;
        case 5:
            filepath = [[NSBundle mainBundle] pathForResource:@"words5" ofType:@"txt"];
            break;
        case 6:
            filepath = [[NSBundle mainBundle] pathForResource:@"words6" ofType:@"txt"];
            break;
        case 7:
            filepath = [[NSBundle mainBundle] pathForResource:@"words7" ofType:@"txt"];
            break;
        default:
            filepath = [[NSBundle mainBundle] pathForResource:@"words5" ofType:@"txt"];
            break;
    }
    
    NSLog(@"%@", filepath);
    
    NSError *error;
    
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);
    
    // maybe for debugging...
    //NSLog(@"contents: %@", fileContents);
    
    
    NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    
    int x = arc4random_uniform(listArray.count);
    NSString *wordToBeGuessed = listArray[x];
    
    return wordToBeGuessed;
}

- (void) setWrongGuessed: (int) guess
{
    guess = guess - 1;
    wrongGuessed = guess;
    NSLog(@"wrong guessed letters:%i", wrongGuessed);
}

- (void) setHighscore
{
    /*
     You must implement methods with which to store and retrieve high scores in a model called History. You must store high scores persistently, as in a property list 
     */
    
    
    
    score.playername = playername;
    score.score = wrongGuessed;
    
    NSLog(@"playername %@",score.playername);
    NSLog(@"score %d",score.score);
    
    [self saveHighscoreInPlist];
    
    //[[NSUserDefaults standardUserDefaults] setInteger:guesses forKey:@"high_score"];
}

- (void) saveHighscoreInPlist
{
    
    //check earlier saved highscores
    NSDictionary *plistRead = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    NSArray *arrayRead = [plistRead objectForKey:@"data"];
    NSLog(@"count %i",arrayRead.count);
   NSLog(@"array highscore %@",arrayRead);
    //Highscore *oldScoreObject = arrayRead[0];
    //NSLog(@"old score object%d",oldScoreObject.score);
    
    Highscore *scoreObject = [[Highscore alloc]init];
    scoreObject.playername = playername;
    scoreObject.score = wrongGuessed;
    
    NSMutableArray *myArrayToWrite = [NSMutableArray array];
    //[myArrayToWrite addObjectsFromArray:arrayRead];
    BOOL newSet = FALSE;
    int y;
    
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
    if(newSet == FALSE)
    {
        [myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
        [myArrayToWrite addObject:playername];
    }
    
    
    
    /*for(int x = 0; x <arrayRead.count; x++)
    {
        [myArrayToWrite addObject:arrayRead[x]];
    }
    
    NSLog(@"Save data to plist");
    NSLog(@"%@", playername);
    NSLog(@"%i", wrongGuessed);*/
    
    //NSMutableArray *myArrayToWrite = [NSMutableArray array];
    //[myArrayToWrite addObject:[NSNumber numberWithInt:wrongGuessed]];
    //[myArrayToWrite addObject:playername];
    //[myArrayToWrite addObject:scoreObject];
    
    NSMutableDictionary *plistToWrite = [NSMutableDictionary dictionary];
    [plistToWrite setObject:myArrayToWrite forKey:@"data"];
    
    [plistToWrite writeToFile:@"/Users/Shared/highscore.plist" atomically:NO];
    
    //---
    NSDictionary *plistRead2 = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Shared/highscore.plist"];
    NSArray *arrayRead2 = [plistRead2 objectForKey:@"data"];
    NSLog(@"count %i",arrayRead2.count);
    NSLog(@"array highscore %@",arrayRead2);
    
    
}

- (void) resetGameManager
{
    // reset the variabeles of the Singleton
    NSLog(@"Reset the Gamemanager");
    [self loadWord:lengthWord];
    wrongGuessed = 0;
    guessNr = 0;
    score = nil;
    
}



- (void)dealloc {
    // Should never be called, but just here for clarity really.
}



@end
