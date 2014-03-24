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
@synthesize anotherDict;

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
        //[self loadWord:lengthWord];
        [self loadPlist];
        [self setPlayername:@"Player"];
    }
    return self;
}

- (void)loadWord: (int)wordLength  {
    [self loadPlist];
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
    [self loadWord:lengthWord];
}

- (void) loadPlist
{
    NSLog(@"load plist");
    NSURL* url = [[NSBundle mainBundle] URLForResource: @"words" withExtension: @"plist"];
    NSArray* myArray = [NSArray arrayWithContentsOfURL: url];
    NSLog(@"%lu", (unsigned long)myArray.count);
    NSLog(@"length word: %i", [myArray[1]length]);
    //NSDictionary   *dict = [NSDictionary dictionaryWithObject: @"Woord" forKey: @"Woordenboek"];
    anotherDict = [NSMutableDictionary dictionary];
    
    NSMutableArray *word1 = [NSMutableArray array];
    NSMutableArray *word2 = [NSMutableArray array];
    NSMutableArray *word3 = [NSMutableArray array];
    NSMutableArray *word4 = [NSMutableArray array];
    NSMutableArray *word5 = [NSMutableArray array];
    NSMutableArray *word6 = [NSMutableArray array];
    NSMutableArray *word7 = [NSMutableArray array];
    NSMutableArray *word8 = [NSMutableArray array];
    NSMutableArray *word9 = [NSMutableArray array];
    NSMutableArray *word10 = [NSMutableArray array];
    NSMutableArray *word11 = [NSMutableArray array];
    NSMutableArray *word12 = [NSMutableArray array];
    
    for(int x = 0; x < myArray.count-1; x++)
    {
        switch ([myArray[x]length]) {
            case 1:
                [word1 addObject:myArray[x]];
                break;
            case 2:
                [word2 addObject:myArray[x]];
                break;
            case 3:
                [word3 addObject:myArray[x]];
                break;
            case 4:
                [word4 addObject:myArray[x]];
                break;
            case 5:
                [word5 addObject:myArray[x]];
                break;
            case 6:
                [word6 addObject:myArray[x]];
                break;
            case 7:
                [word7 addObject:myArray[x]];
                break;
            case 8:
                [word8 addObject:myArray[x]];
                break;
            case 9:
                [word9 addObject:myArray[x]];
                break;
            case 10:
                [word10 addObject:myArray[x]];
                break;
            case 11:
                [word11 addObject:myArray[x]];
                break;
            case 12:
                [word12 addObject:myArray[x]];
                break;
            default:
                break;
        }
    }
    
    [anotherDict setObject:word1 forKey: @"length1"];
    [anotherDict setObject:word2 forKey: @"length2"];
    [anotherDict setObject:word3 forKey: @"length3"];
    [anotherDict setObject:word4 forKey: @"length4"];
    [anotherDict setObject:word5 forKey: @"length5"];
    [anotherDict setObject:word6 forKey: @"length6"];
    [anotherDict setObject:word7 forKey: @"length7"];
    [anotherDict setObject:word8 forKey: @"length8"];
    [anotherDict setObject:word9 forKey: @"length9"];
    [anotherDict setObject:word10 forKey: @"length10"];
    [anotherDict setObject:word11 forKey: @"length11"];
    [anotherDict setObject:word12 forKey: @"length12"];
    
    //NSLog(@"Dictionary: %@, Mutable Dictionary: %@", dict, anotherDict);
    
    // now we can save these to a file
    NSString   *savePath = [@"~/Documents/Saved.data" stringByExpandingTildeInPath];
    [anotherDict writeToFile: savePath atomically: YES];
    
    [self loadFile:5];
}

- (NSString*) loadFile: (int) lenghtWord
{
    NSMutableArray *words = [anotherDict objectForKey:@"length5"];
    NSLog(@"words of length 5 %@",words);
    
    switch (lengthWord) {
        case 1:
            words =[anotherDict objectForKey:@"length1"];
            break;
        case 2:
            words =[anotherDict objectForKey:@"length2"];
            break;
        case 3:
            words =[anotherDict objectForKey:@"length3"];
            break;
        case 4:
            words =[anotherDict objectForKey:@"length4"];
            break;
        case 5:
            words =[anotherDict objectForKey:@"length5"];
            break;
        case 6:
            words =[anotherDict objectForKey:@"length6"];
            break;
        case 7:
            words =[anotherDict objectForKey:@"length7"];
            break;
        case 8:
            words =[anotherDict objectForKey:@"length8"];
            break;
        case 9:
            words =[anotherDict objectForKey:@"length9"];
            break;
        case 10:
            words =[anotherDict objectForKey:@"length10"];
            break;
        case 11:
            words =[anotherDict objectForKey:@"length11"];
            break;
        case 12:
            words =[anotherDict objectForKey:@"length12"];
            break;
        default:
            words =[anotherDict objectForKey:@"length5"];
            break;
    }
    
    NSLog(@"words %@",words);
    
    int x = arc4random_uniform(words.count);
    NSString *wordToBeGuessed = words[x];
    
    word = [wordToBeGuessed uppercaseString];
    
    return word;
}

- (void) setWrongGuessed: (int) guess
{
    guess = guess - 1;
    wrongGuessed = guess;
    NSLog(@"wrong guessed letters:%i", wrongGuessed);
}

- (void) setHighscore
{
    score.playername = playername;
    score.score = wrongGuessed;
    
    [self saveHighscoreInPlist];
}

- (void) saveHighscoreInPlist
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
