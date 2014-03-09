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
        someProperty = @"Default Property Value";
        
    }
    return self;
}

//loadWordFromFile: (int)wordLength
- (void)setWord: (NSString *)woord  {
    [self loadFile];
    
    word = [woord uppercaseString];
    
}

- (void)setPlayername:(NSString *)playerName
{
    playername = playerName;
    
}

- (void)setWordLength: (int) length
{
    lengthWord = length;
}

- (void) loadFile
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"rtf"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSASCIIStringEncoding error:&error];
    
    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);
    
    // maybe for debugging...
    NSLog(@"contents: %@", fileContents);
    
    NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    NSLog(@"items = %d", [listArray count]);
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}



@end
