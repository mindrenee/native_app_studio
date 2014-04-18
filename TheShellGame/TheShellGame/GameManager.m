//
//  GameManager.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize score;
@synthesize amountOfBalls;
@synthesize amountOfCups;
@synthesize cups;
@synthesize player;

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
        [self setAmountOfBalls:1];
        [self setAmountOfCups:3];
        [self setScore:0];
        [self setPlayer:@"Renee"];
        cups = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void) setAmountOfBalls:(int)amountOfBallsNew{
    amountOfBalls = amountOfBallsNew;
}

- (void) setAmountOfCups:(int)amountOfCupsNew{
    amountOfCups = amountOfCupsNew;
    [self createCups];
}

- (void) setScore:(int)scoreNew{
    score = scoreNew;
}

- (void) createCups{
    if (!cups) cups = [[NSMutableArray alloc] init];
    for(int i; i<amountOfCups; i++){
        SKSpriteNode *cup = [SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
        [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 200)];
        CGPoint point = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
        cup.position = point;
        cup.name = @"cup";
        cup.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:cup.frame.size];
        cup.physicsBody.dynamic = NO;
        [cups addObject:cup];
    }
    [cups addObject:@"Hallo?"];
    NSLog(@"cups: %@",self.cups[0]);
    for (id cup in self.cups) {
        NSLog(@"%@", cup);
    }
}

- (void) insertHighscoreInDB{
    //CREATE URL TO SEND
	NSString *urlString = [NSString stringWithFormat:@"name=%@&score=%i",player,score];
	NSLog(@"user registration string:%@",urlString);
	//POST THE STRING
    NSData *postData = [urlString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost/~rwitsenburg/api.php"]];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
	// We should probably be parsing the data returned by this call, for now just check the error.
    NSData *myData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	NSError *outError = NULL;
	NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:&outError];
    
	NSLog(@"Dict of errors:%@",tempDict);
}

- (void) resetGameManager
{
    // reset the variabeles of the Singleton
    [self setScore:0];
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
