//
//  HangmanViewController.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "LetterButton.h"

@interface HangmanViewController : UIViewController

@property (nonatomic) NSMutableArray *word;
@property (nonatomic) NSArray *guessed;
@property (nonatomic) int guess;

@end
