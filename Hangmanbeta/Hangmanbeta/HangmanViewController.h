//
//  HangmanViewController.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "LetterButton.h"
#import "MenuViewController.h"

@interface HangmanViewController : UIViewController

@property (nonatomic) NSMutableArray *word;
@property (nonatomic) NSMutableArray *guessed;
@property (nonatomic) int guess;


@end
