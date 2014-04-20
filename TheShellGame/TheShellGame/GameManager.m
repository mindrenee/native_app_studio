//
//  GameManager.m
//  TheShellGame
//
//  Created by R Witsenburg on 06-04-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize gameScore;
@synthesize amountOfBalls;
@synthesize amountOfCups;
@synthesize cups;
@synthesize player;
@synthesize arrayScore;
@synthesize notUploadedHighscores;
@synthesize balls;

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
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        int loadedCups;
        int loadedBalls;
        if([defaults objectForKey:@"numberOfCups"] == nil){
            loadedCups = 3;
            loadedBalls = 1;
        }
        else{
            loadedCups = [[defaults objectForKey:@"numberOfCups"] intValue];
            loadedBalls = [[defaults objectForKey:@"numberOfBalls"] intValue];
        }
        [self setAmountOfBalls:loadedBalls];
        [self setAmountOfCups:loadedCups];
        [self setGameScore:0];
        [self setPlayer:@"Renee"];
        [self getOnlineHighscore];
        NSLog(@"Interwebs? %i",[self connectedToInternet]);
        [self sync];
    }
    return self;
}

- (void) setAmountOfBalls:(int)amountOfBallsNew{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    amountOfBalls = amountOfBallsNew;
    NSNumber *numberOfBalls = [NSNumber numberWithInt:amountOfBalls];
    balls = [NSMutableArray arrayWithCapacity:amountOfBalls];
    
    [defaults setObject:numberOfBalls forKey:@"numberOfBalls"];
    [defaults synchronize];
}

- (void) setAmountOfCups:(int)amountOfCupsNew{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    amountOfCups = amountOfCupsNew;
    NSNumber *numberOfCups = [NSNumber numberWithInt:amountOfCups];
    cups = [NSMutableArray arrayWithCapacity:amountOfCups];
    
    [defaults setObject:numberOfCups forKey:@"numberOfCups"];
    [defaults synchronize];
    
    [self createSprites];
}

- (void) setScore:(int)scoreNew{
    gameScore = scoreNew;
}

- (void) createSprites{

    CGPoint startpoint;
    int startspace = 0;
    int space = 150;

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
        [cup setXScale:1.0];
        [cup setYScale:1.5];
        cup.name = cupname;
        cup.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:cup.frame.size];
        cup.physicsBody.dynamic = NO;
        cup.position = startpoint;
        [cups addObject:cup];
        startspace = startspace + space;
        
    }
    [self createBallArray];
}

- (void) createBallArray{
    
    CGPoint startpoint;
    int startspace = 0;
    int space = 150;
    
    for (int i = 0; i<amountOfBalls; i++) {
        if(amountOfCups%2 == 0){
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -225 + startspace, [[UIScreen mainScreen] bounds].size.height/2 - 105);
        }
        else if(amountOfCups == 3){
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -150 + startspace, [[UIScreen mainScreen] bounds].size.height/2 - 105);
        }
        else if(amountOfCups == 5){
            startpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 -300 + startspace, [[UIScreen mainScreen] bounds].size.height/2);
        }
        SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"pingpongbal"];
        NSString *ballname = [NSString stringWithFormat:@"ball%i",i];
        [ball setXScale:1.0];
        [ball setYScale:1.5];
        ball.name = ballname;
        ball.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ball.frame.size];
        ball.physicsBody.dynamic = NO;
        ball.position = startpoint;
        [balls addObject:ball];
        if(amountOfBalls>1){
            startspace = startspace + space;
        }
    }
    NSLog(@"%@",balls);

}

- (void) insertHighscoreInDB{
    //FROM: http://www.techrepublic.com/article/create-your-own-web-service-for-an-ios-app-part-four/#.
    //CREATE URL TO SEND
	NSString *urlString = [NSString stringWithFormat:@"name=%@&score=%i",player,gameScore];
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
    [self getOnlineHighscore];
}

- (void) getOnlineHighscore{
    NSString *urlAPI = [NSString stringWithFormat:@"http://localhost/~rwitsenburg/api.php?method=getScores"];
    NSData *dataUrlAPI = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAPI]];
    NSString *strAPIResults = [[NSString alloc] initWithData:dataUrlAPI encoding:NSUTF8StringEncoding];
    arrayScore = [strAPIResults componentsSeparatedByString:@" "];
    NSLog(@"%@", arrayScore);
}

- (void) highScoresToUpload{
    //highscores saved while offline playing
    [notUploadedHighscores addObject:player];
    NSNumber* scoreNumber = [NSNumber numberWithInt:gameScore];
    [notUploadedHighscores addObject:scoreNumber];
    // Store the data
    NSArray *savedhighscores = [notUploadedHighscores copy];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:savedhighscores forKey:@"savedHighScoresShellGame"];
    
    [defaults synchronize];
    
}

- (void) sync{
    if([self connectedToInternet]){
    //insert saved highscores that not have been inserted in the DB
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *newHighScores = [defaults objectForKey:@"savedHighScoresShellGame"];
    
    for(int x = 0; x <newHighScores.count; x++){
        if((x%2)==0){
            NSString *playername = newHighScores[x];
            player = playername;
        }
        else{
            int playerscore = [newHighScores[x] integerValue];
            gameScore = playerscore;
        }
        [self insertHighscoreInDB];
    }

    
    //clear highScoresToUpload
    [notUploadedHighscores removeAllObjects];
    NSArray *savedhighscores = [notUploadedHighscores copy];
    [defaults setObject:savedhighscores forKey:@"savedHighScoresShellGame"];
    [defaults synchronize];
    
    //pull DB into NSUserdefaults
    [defaults setObject:arrayScore forKey:@"offlineHighScoresShellGame"];
    [defaults synchronize];
    NSLog(@"arrayScore in NSUserDefaults: %@",arrayScore);
    }
}

- (BOOL) connectedToInternet
{
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    return ( URLString != NULL ) ? YES : NO;
}

- (void) resetGameManager
{
    // reset the variabeles of the Singleton
    [self setGameScore:0];
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
