//
//  GameManager.m
//  Hangmanbeta
//
//  Created by R Witsenburg on 08-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize someProperty;

@synthesize playername;
@synthesize lengthWord;
@synthesize word;
@synthesize wrongGuessed;
@synthesize guessNr;

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
    NSLog(@"%d",lengthWord);
    [self loadWord:lengthWord];
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


- (void) setHighscore: (NSString *) player wrongGuesses: (int) guesses
{
    
    [[NSUserDefaults standardUserDefaults] setInteger:guesses forKey:@"high_score"];
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}



@end
