HANGMAN FOR iOS iPad
=============
Summary
-------------
Play Hangman against your iPad. Guess letters to complete the word before you hang. 
This app is created during the minor mprog as project by Renee Witsenburg.

List of database tables and fields (and their types)
-------------
none, I will use the given plist with words.

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
* HighScoreViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void) loadHighscore
  * - (void)didReceiveMemoryWarning
* HangmanViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void) loadLettersView
  * - (void) guess: (id)sender
  * - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
  * - (void) loadWord
  * - (void) loadImageHangman: (int) guess
  * - (BOOL) hasBeenGuessed
  * - (void) goToHighScore
  * - (void)didReceiveMemoryWarning
* MenuViewController
  * - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil return self
  * - (void)viewDidLoad
  * - (void)didReceiveMemoryWarning
* GameManager
  * + (id)sharedManager
  * - (id)init
  * - (void)loadWord: (int)wordLength
  * - (void)setPlayername:(NSString *)playerName
  * - (void)setWordLength: (int) length
  * - (void) loadPlist
  * - (NSString*) loadFile: (int) lenghtWord
  * - (void) setWrongGuessed: (int) guess
  * - (void) setHighscore
  * - (void) saveHighscoreInPlist
  * - (void) resetGameManager
  * - (void)dealloc
* Highscore
* LetterButton
  * - (id)initWithFrame:(CGRect)frame


UI
-------------
* Menu<br/>
![Alt text](/doc/mockup_galgje_menu.png "Hangman menu")
* Game<br/>
![Alt text](/doc/mockup_galgje.png "Hangman the game")
* Settings<br/>
![Alt text](/doc/mockup_settings.png "Hangman settings")
* Highscore<br/>
![Alt text](/doc/mockup_galgje_highscore.png "Hangman highscore")

Style Guide
-------------
I will use the Cocoa coding guidelines.
