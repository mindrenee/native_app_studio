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
* Settings
  * (void) saveName(String name)
* Highscore
  * (void) SaveHighscore(String name, int score)
  * Load highscore() return highscore
  * (String) getName() return name
* Letter
  * (BOOL) Guessletter(char letter) return true/false
* Word
  * (int) LengthWord() return length
  * (String) LoadWord(int length) return word
* Galg
  * (void) LoadImage(int guessedLetters)
  * (void) GuessedLetters(char letter)


UI
-------------
* Menu<br/>
![Alt text](/doc/mockup_galgje_menu.png "Hangman menu")
* Game<br/>
![Alt text](/doc/mockup_galgje.png "Hangman the game")
* Settings<br/>
![Alt text](/doc/mockup_settings.png "Hangman settings")
* Highscore<br/>

Style Guide
-------------
I will use the Cocoa coding guidelines.
