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

/*+ (id)sharedManager {
    static GameManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}*/

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

- (void)loadWordFromFile: (int)wordLength setWord: (NSString *)woord  {
    word = woord;
    
}

- (void)setPlayername:(NSString *)playerName
{
    playername = playerName;
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
