//
//  HangmanViewController.m
//  Hangmanbeta
//
//  Created by R Witsenburg on 05-03-14.
//  Copyright (c) 2014 R Witsenburg. All rights reserved.
//

#import "HangmanViewController.h"

@interface HangmanViewController ()

@end

@implementation HangmanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Game *game1 = [[Game alloc]init];
    game1.word = @"HANGMAN";
    game1.playername = @"Renee";
    game1.lengthWord = 7;
    game1.guessNr = 10;
    
    _guess = 1;
    
    _word = [[NSMutableArray alloc]init];
    _guessed = [[NSMutableArray alloc] init];
    for (int i = 0; i < [game1.word length]; i++) {
        [_word addObject:[NSString stringWithFormat:@"%C", [game1.word characterAtIndex:i]]];
        [_guessed addObject:[NSNumber numberWithBool:NO]];
    }
    
    
    
    //[array addObject:[NSNumber numberWithBool:NO]];
    
    
    [self loadWord];
    [self loadLettersView];
    [self loadImageHangman:_guess];
    
	// Do any additional setup after loading the view.
}

-(void) loadLettersView
{
    LetterButton *a = [[LetterButton alloc]init];
    a.letter = 'a';
    //a.backgroundColor = [UIColor blackColor];
    [a addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [a setTitle:@"A" forState:UIControlStateNormal];
    a.frame = CGRectMake(10.0, 360.0, 30.0, 30.0);
    [self.view addSubview:a];
    
    LetterButton *b = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    b.letter = 'b';
    [b addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [b setTitle:@"B" forState:UIControlStateNormal];
    b.frame = CGRectMake(40.0, 360.0, 30.0, 30.0);
    [self.view addSubview:b];
    
    LetterButton *c = [[LetterButton alloc]init];
    c.letter = 'c';
    //a.backgroundColor = [UIColor blackColor];
    [c addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [c setTitle:@"C" forState:UIControlStateNormal];
    c.frame = CGRectMake(70.0, 360.0, 30.0, 30.0);
    [self.view addSubview:c];
    
    LetterButton *d = [[LetterButton alloc]init];
    d.letter = 'd';
    //a.backgroundColor = [UIColor blackColor];
    [d addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [d setTitle:@"D" forState:UIControlStateNormal];
    d.frame = CGRectMake(100.0, 360.0, 30.0, 30.0);
    [self.view addSubview:d];
    
    LetterButton *e = [[LetterButton alloc]init];
    e.letter = 'e';
    //a.backgroundColor = [UIColor blackColor];
    [e addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [e setTitle:@"E" forState:UIControlStateNormal];
    e.frame = CGRectMake(130.0, 360.0, 30.0, 30.0);
    [self.view addSubview:e];

    LetterButton *f = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    f.letter = 'f';
    [f addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [f setTitle:@"F" forState:UIControlStateNormal];
    f.frame = CGRectMake(160.0, 360.0, 30.0, 30.0);
    [self.view addSubview:f];
    
    LetterButton *g = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    g.letter = 'g';
    [g addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [g setTitle:@"G" forState:UIControlStateNormal];
    g.frame = CGRectMake(190.0, 360.0, 30.0, 30.0);
    [self.view addSubview:g];
    
    LetterButton *h = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    h.letter = 'h';
    [h addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [h setTitle:@"H" forState:UIControlStateNormal];
    h.frame = CGRectMake(220.0, 360.0, 30.0, 30.0);
    [self.view addSubview:h];
    
    LetterButton *i = [[LetterButton alloc]init];
    i.letter = 'i';
    //a.backgroundColor = [UIColor blackColor];
    [i addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [i setTitle:@"I" forState:UIControlStateNormal];
    i.frame = CGRectMake(250.0, 360.0, 30.0, 30.0);
    [self.view addSubview:i];
    
    LetterButton *j = [[LetterButton alloc]init];
    j.letter = 'j';
    //a.backgroundColor = [UIColor blackColor];
    [j addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [j setTitle:@"J" forState:UIControlStateNormal];
    j.frame = CGRectMake(280.0, 360.0, 30.0, 30.0);
    [self.view addSubview:j];
    
    LetterButton *k = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    k.letter = 'k';
    [k addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [k setTitle:@"K" forState:UIControlStateNormal];
    k.frame = CGRectMake(10.0, 390.0, 30.0, 30.0);
    [self.view addSubview:k];
    
    LetterButton *l = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    l.letter = 'l';
    [l addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [l setTitle:@"L" forState:UIControlStateNormal];
    l.frame = CGRectMake(40.0, 390.0, 30.0, 30.0);
    [self.view addSubview:l];
    
    LetterButton *m = [[LetterButton alloc]init];
    m.letter = 'm';
    //a.backgroundColor = [UIColor blackColor];
    [m addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [m setTitle:@"M" forState:UIControlStateNormal];
    m.frame = CGRectMake(70.0, 390.0, 30.0, 30.0);
    [self.view addSubview:m];
    
    LetterButton *n = [[LetterButton alloc]init];
    n.letter = 'n';
    //a.backgroundColor = [UIColor blackColor];
    [n addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [n setTitle:@"N" forState:UIControlStateNormal];
    n.frame = CGRectMake(100.0, 390.0, 30.0, 30.0);
    [self.view addSubview:n];
    
    LetterButton *o = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    o.letter = 'o';
    [o addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [o setTitle:@"O" forState:UIControlStateNormal];
    o.frame = CGRectMake(130.0, 390.0, 30.0, 30.0);
    [self.view addSubview:o];
    
    LetterButton *p = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    p.letter = 'p';
    [p addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [p setTitle:@"K" forState:UIControlStateNormal];
    p.frame = CGRectMake(160.0, 390.0, 30.0, 30.0);
    [self.view addSubview:p];
    
    LetterButton *q = [[LetterButton alloc]init];
    q.letter = 'q';
    //a.backgroundColor = [UIColor blackColor];
    [q addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [q setTitle:@"Q" forState:UIControlStateNormal];
    q.frame = CGRectMake(190.0, 390.0, 30.0, 30.0);
    [self.view addSubview:q];
    
    LetterButton *r = [[LetterButton alloc]init];
    r.letter = 'r';
    //a.backgroundColor = [UIColor blackColor];
    [r addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [r setTitle:@"R" forState:UIControlStateNormal];
    r.frame = CGRectMake(220.0, 390.0, 30.0, 30.0);
    [self.view addSubview:r];
    
    LetterButton *s = [[LetterButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    s.letter = 's';
    [s addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [s setTitle:@"S" forState:UIControlStateNormal];
    s.frame = CGRectMake(250.0, 390.0, 30.0, 30.0);
    [self.view addSubview:s];
    
    LetterButton *t = [[LetterButton alloc]init];
    t.letter = 't';
    //a.backgroundColor = [UIColor blackColor];
    [t addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [t setTitle:@"T" forState:UIControlStateNormal];
    t.frame = CGRectMake(280.0, 390.0, 30.0, 30.0);
    [self.view addSubview:t];
    
    LetterButton *u = [[LetterButton alloc]init];
    u.letter = 'u';
    //a.backgroundColor = [UIColor blackColor];
    [u addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [u setTitle:@"U" forState:UIControlStateNormal];
    u.frame = CGRectMake(70.0, 420.0, 30.0, 30.0);
    [self.view addSubview:u];
    
    //vwxyz
    LetterButton *v = [[LetterButton alloc]init];
    v.letter = 'v';
    //a.backgroundColor = [UIColor blackColor];
    [v addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [v setTitle:@"V" forState:UIControlStateNormal];
    v.frame = CGRectMake(100.0, 420.0, 30.0, 30.0);
    [self.view addSubview:v];
    
    LetterButton *w = [[LetterButton alloc]init];
    w.letter = 'w';
    //a.backgroundColor = [UIColor blackColor];
    [w addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [w setTitle:@"W" forState:UIControlStateNormal];
    w.frame = CGRectMake(130.0, 420.0, 30.0, 30.0);
    [self.view addSubview:w];
    
    LetterButton *x = [[LetterButton alloc]init];
    x.letter = 'x';
    //a.backgroundColor = [UIColor blackColor];
    [x addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [x setTitle:@"X" forState:UIControlStateNormal];
    x.frame = CGRectMake(160.0, 420.0, 30.0, 30.0);
    [self.view addSubview:x];
    
    LetterButton *y = [[LetterButton alloc]init];
    y.letter = 'y';
    //a.backgroundColor = [UIColor blackColor];
    [y addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [y setTitle:@"Y" forState:UIControlStateNormal];
    y.frame = CGRectMake(190.0, 420.0, 30.0, 30.0);
    [self.view addSubview:y];
    
    LetterButton *z = [[LetterButton alloc]init];
    z.letter = 'z';
    //a.backgroundColor = [UIColor blackColor];
    [z addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [z setTitle:@"Z" forState:UIControlStateNormal];
    z.frame = CGRectMake(220.0, 420.0, 30.0, 30.0);
    [self.view addSubview:z];
}

- (void) guess: (id)sender
{
    NSString *guessedLetter = [NSString stringWithFormat:@"%c", ((LetterButton*)sender).letter];
    guessedLetter = guessedLetter.uppercaseString;
    BOOL right = true;
    
    for (int i = 0; i < _word.count; i++) {
        if([_word[i] isEqualToString:guessedLetter])
        {
            [sender setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
            [_guessed replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:YES]];
            //[_guessed addObject:[NSNumber numberWithBool:YES] atIndex:i];
            
            //[_guessed[i] addObject:[NSNumber numberWithBool:true]];
            right = true;
            break;
        }
        else
        {
            right = false;
        }
    }
    if(right == false){
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        NSLog(@"%d", _guess);
        _guess = _guess + 1;
        [self loadImageHangman:_guess];
    }
    [self loadWord];
}

- (void) loadWord
{
    NSLog(@"load word");
    //const char *c = [word UTF8String];
    int spaceBetweenChars = 0;
    //[guessed setOn:[[_guessed objectAtIndex:i] boolValue]];
    for (int i = 0; i < _word.count; i++) {
        
        //[guessed setOn:[[_guessed objectAtIndex:i] boolValue]];
        BOOL b = [[_guessed objectAtIndex:i] boolValue];
        NSLog(@"bool: %hhd", b);
        if (b == 1) {
            UILabel *guessLetter = [[UILabel alloc]init];
            guessLetter.textColor = [UIColor whiteColor];
            guessLetter.frame = CGRectMake(50 + spaceBetweenChars, 300, 30, 30);
            [guessLetter setText:_word[i]];
            [self.view addSubview:guessLetter];
            NSLog(@"%@",_word[i]); // char is guessed, so print it
        }
        else
        {
            UILabel *guessLetter = [[UILabel alloc]init];
            guessLetter.textColor = [UIColor whiteColor];
            guessLetter.frame = CGRectMake(50 + spaceBetweenChars, 300, 30, 30);
            [guessLetter setText:@"_"];
            [self.view addSubview:guessLetter];
            //NSLog(@"."); // char is not guessed yet, so hide it
        }
        spaceBetweenChars = spaceBetweenChars+30;
    }
    
    
    /*for(int y = 0; y < _word.count; y++)
    {
        NSLog(@"%@\n",_word[y]);
    }*/
    
    
    /*for(int x = 0; x < _word.count; x++)
    {
        UILabel *guessLetter = [[UILabel alloc]init];
        guessLetter.textColor = [UIColor whiteColor];
        guessLetter.frame = CGRectMake(50 + spaceBetweenChars, 300, 30, 30);
        [guessLetter setText:@"_"];
        [self.view addSubview:guessLetter];
        spaceBetweenChars = spaceBetweenChars+30;
        
        
    }*/
}

- (void) loadImageHangman: (int) guess
{
    if(guess > 10){
        NSLog(@"You lost");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Loser!"
                                                        message:@"You lost the game"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    NSString *image = [NSString stringWithFormat:@"%d", guess];
    UIImage * myImage = [UIImage imageNamed: image];
    UIImageView *hangman = [[UIImageView alloc] initWithImage: myImage];
    hangman.backgroundColor = [UIColor whiteColor];
    hangman.frame = CGRectMake(70, 100, 140, 180);
    [self.view addSubview:hangman];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
