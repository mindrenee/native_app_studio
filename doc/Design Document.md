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
  * + (void) loadPlist(lokatie?)
  * - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  * - (void)applicationWillResignActive:(UIApplication *)application
  * - (void)applicationDidEnterBackground:(UIApplication *)application
  * - (void)applicationWillEnterForeground:(UIApplication *)application
  * - (void)applicationDidBecomeActive:(UIApplication *)application
  * - (void)applicationWillTerminate:(UIApplication *)application
* Settings
  * + (void) setName(String name)
  * - (String) getName() return name
  * + (int) LengthWord() return length
  * - (void) setLengthWord()
* Highscore
  * - (void) SaveHighscore(String name, int score)
  * - (mutablearray)Load highscore() return highscore
  * - (String) getName() return name
* Letter
  * (BOOL) Guessedletter(char letter) return true/false
* Word
  * (String) LoadWord(int length) return word
* Galg
  * (void) LoadImage(int guessedLetters)
  * (void) GuessedLetters(char letter)
  * (BOOL) WordGuessed() return true/false

UI
-------------
* Menu<br/>
![Alt text](/doc/mockup_galgje_menu.png "Hangman menu")
* Game<br/>
![Alt text](/doc/mockup_galgje.png "Hangman the game")
* Settings<br/>
![Alt text](/doc/mockup_settings.png "Hangman settings")
* Highscore<br/>
![Alt text](/doc/mockup_highscore.png "Hangman highscore")

Style Guide
-------------
I will use the Cocoa coding guidelines.
