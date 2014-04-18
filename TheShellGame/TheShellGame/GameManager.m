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
    }
    return self;
}

- (void) setAmountOfBalls:(int)amountOfBallsNew{
    amountOfBalls = amountOfBallsNew;
}

- (void) setAmountOfCups:(int)amountOfCupsNew{
    amountOfCups = amountOfCupsNew;
    cups = [NSMutableArray arrayWithCapacity:amountOfCups];
    [self createCups];
}

- (void) setScore:(int)scoreNew{
    score = scoreNew;
}

- (void) createCups{

    CGPoint startpoint;
    int startspace = 0;
    int space = 150;
    
    //cups = [NSMutableArray arrayWithCapacity:amountOfCups];
    for (int i = 0; i<amountOfCups; i++) {
        if(amountOfCups == 3){
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -150 + startspace, [[UIScreen mainScreen] bounds].size.height/2);
        }
        else if (amountOfCups ==4){
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -225 + startspace, [[UIScreen mainScreen] bounds].size.height/2);
        }
        else{ //amountOfCups == 5
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -300 + startspace, [[UIScreen mainScreen] bounds].size.height/2);
        }
        SKSpriteNode *cup = [SKSpriteNode spriteNodeWithImageNamed:@"blikje"];
        NSString *cupname = [NSString stringWithFormat:@"cup%i",i];
        cup.name = cupname;
        cup.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:cup.frame.size];
        cup.physicsBody.dynamic = NO;
        cup.position = startpoint;
        [cups addObject:cup];
        startspace = startspace + space;
        
    }
}

- (void) insertHighscoreInDB{
    //FROM: http://www.techrepublic.com/article/create-your-own-web-service-for-an-ios-app-part-four/#.
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
