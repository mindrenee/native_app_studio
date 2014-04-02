THE SHELL GAME FOR iOS iPad
=============
Summary
-------------
Game "The shell game"
This app is created during the minor mprog as project by Renee Witsenburg.

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
* SettingsViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void)sliderAction
  * - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
  * - (void) save: (id)sender
  * - (void)didReceiveMemoryWarning
* HighscoreViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void) loadHighscore
  * - (void)didReceiveMemoryWarning
* GameViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void)animateCups
  * - (void)viewGuess
  * - (void)viewBall
  * - (void)didReceiveMemoryWarning
* Gamemanager
  * + (id)sharedManager
  * - (id)init
  * - (void) setPlayer
  * - (void) setAmountOfCups
  * - (BOOL) guessed
  * - (void) setGuessed
  * - (void) saveHighscoreInPlist
  * - (void) saveHighscoreInDatabase
  * - (void) resetGameManager
  * - (void)dealloc
* Cup
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad

UI
-------------

Style Guide
-------------
I will use the Cocoa coding guidelines.
