//
//  GameManager.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 08-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject{
    NSString *someProperty;
    
    NSString *playername;
    int lengthWord;
    NSString *word;
    int guessNr;
    int wrongGuessed;
}

- (void)setWordLength: (int) length;

@property (nonatomic, retain) NSString *someProperty;

@property(nonatomic) NSString *playername;
@property(nonatomic) int lengthWord;
@property(nonatomic) NSString *word;
@property(nonatomic) int guessNr;
@property (nonatomic) int wrongGuessed;

+ (id)sharedManager;



@end

