HANGMAN FOR iOS iPad
=============
Summary
-------------
Play Hangman against your iPad. Guess letters to complete the word before you hang. 
This app is created during the minor mprog as project by Renee Witsenburg.

List of database tables and fields (and their types)
-------------
none

List of classes and methods (and their return types and/or arguments)
-------------
* Highscore
  * (void) SaveHighscore(String name, int score)
  * Load highscore() return highscore
* Letter
  * (BOOL) Guessletter(char letter) return true/false
* Word
  * (int) LengthWord() return length
  * (String) LoadWord(int length) return word
* Galg
  * (void) LoadImage(int guessedLetters)
* 

UI
-------------

Style Guide
-------------
I will use the Cocoa coding guidelines.
