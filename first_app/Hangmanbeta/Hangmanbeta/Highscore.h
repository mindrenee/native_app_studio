//
//  Highscore.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 23-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Highscore : NSObject
{
    NSString *playername;
    int score;
}

@property (nonatomic) NSString *playername;
@property (nonatomic) int score;

@end
