THE SHELL GAME FOR iOS iPad
=============
Summary
-------------
Game "The shell game"
This app is created during the minor mprog as project by Renee Witsenburg. The shell game is a game were you first see a pingpongball under a can. When the ball is disappeared the can and the other cans begin to move. When all the movements are finished, you must guess under which can the pingpongball is.

List of database tables and fields (and their types)
-------------
Id INTEGER AUTO_INCREMENT
Player VARCHAR(30) 
Score INTEGER

List of classes and methods (and their return types and/or arguments)
-------------
* AppDelegate
  * - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  * - (void)applicationWillResignActive:(UIApplication *)application
  * - (void)applicationDidEnterBackground:(UIApplication *)application
  * - (void)applicationWillEnterForeground:(UIApplication *)application
  * - (void)applicationDidBecomeActive:(UIApplication *)application
  * - (void)applicationWillTerminate:(UIApplication *)application
* Gamemanager
  * + (id)sharedManager
  * - (BOOL) connectedToInternet
  * - (void) createBallArray
  * - (void) createSprites
  * - (void)dealloc
  * - (void) getOnlineHighscore
  * - (void) highScoresToUpload
  * - (id)init
  * - (void) insertHighscoreInDB
  * - (void) resetGameManager
  * - (void) setAmountOfBalls:(int)amountOfBallsNew
  * - (void) setAmountOfCups:(int)amountOfCupsNew
  * - (void) sync
* GameScene 
  * - (void)addSprites:(CGSize)size
  * -(void) didMoveToView:(SKView *)view
  * -(id)initWithSize:(CGSize)size
  * -(void)moveCups
  * -(void) moveToHome
  * - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
  * -(void)update:(CFTimeInterval)currentTime
* HighscoreScene
  * -(void) didMoveToView:(SKView *)view
  * -(id)initWithSize:(CGSize)size 
  * -(void) moveToHome
* MenuScene 
  * -(void) didMoveToView:(SKView *)view
  * -(id)initWithSize:(CGSize)size
  * -(void) moveToGame
  * -(void) moveToHighScore
  * -(void) moveToOptions
* OptionsScene
  * -(void) didMoveToView:(SKView *)view
  * -(id)initWithSize:(CGSize)size 
  * -(void) moveToHome
  * -(void)sliderAction
* PreHighscoreScene
  * -(void) didMoveToView:(SKView *)view
  * - (void) goToHighscore{
  * -(id)initWithSize:(CGSize)size 
  * -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
* ViewController
  * - (void)didReceiveMemoryWarning
  * - (BOOL)prefersStatusBarHidden 
  * - (BOOL)shouldAutorotate
  * - (NSUInteger)supportedInterfaceOrientations
  * - (void)viewDidLoad

* class highscoreAPI
  * __construct()
  * __destruct()
  * getScores()
  * insertScore()

UI
-------------

Style Guide
-------------
I will use the Cocoa coding guidelines.
