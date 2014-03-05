//
//  Game.h
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property(nonatomic) NSString *playername;
@property(nonatomic) int *lengthWord;
@property(nonatomic) NSString *word;


@end
