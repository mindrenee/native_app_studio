HANGMAN FOR iOS iPad
=============
Summary
-------------
Play Hangman against your iPad. Guess letters to complete the word before you hang. 
This app is created during the minor mprog as project by Renee Witsenburg.

Features
-------------
* Chose the length of a word in the menu and start the game.
* Change the settings in the menu.
* Choose to start a new game or to resume your last game.
* Display a highscore after you played a game. (the player with the least guesses is on the top)
* Save the highscore in a plist.
* Guess letters to guess the hidden word.
* Letter is not guessed yet -> black.
* Letter is right -> green
* Letter is wrong -> red + part of the hangman
* You can change settings in the game.
* When you quit the game, the game will be saved.
* Load the words from a plist

Frameworks
-------------
List of used frameworks
*CoreGraphics
*UIKit
*Foundation

Languages
-------------
The app is programmed in Xcode in Objective C.

Libraries
-------------
None

Mockup
-------------
When the app is loaded, you will see the menu
![Alt text](/doc/mockup_galgje_menu.png "Hangman menu")
When you click on 'start spel', the game will start. You can click on the letters. If you guess is right, the letter
will turn green and become visible at the empty places. When you guess is wrong, the letter become red and hangman 
grow.
![Alt text](/doc/mockup_galgje.png "Hangman the game")
When you win or lose the game, the highscore will appear.
![Alt text](/doc/mockup_galgje_highscore.png "Hangman highscore")

Deployment
-------------
Copy the Hangmanbeta to your computer. You can need to start the project into XCode to run it on the simulator. You can load it with "Hangmanbeta.xcodeproj". Run the project in the simulator.
