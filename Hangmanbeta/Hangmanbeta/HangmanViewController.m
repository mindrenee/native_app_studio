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
    
    [self loadLengthWord:game1.lengthWord];
    [self loadLettersView];
    
	// Do any additional setup after loading the view.
}

-(void) loadLettersView
{
    UIButton *a = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [a addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [a setTitle:@"A" forState:UIControlStateNormal];
    a.frame = CGRectMake(10.0, 300.0, 30.0, 30.0);
    [self.view addSubview:a];
    
    UIButton *b = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [b addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [b setTitle:@"B" forState:UIControlStateNormal];
    b.frame = CGRectMake(40.0, 300.0, 30.0, 30.0);
    [self.view addSubview:b];
    
    UIButton *c = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [c addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [c setTitle:@"C" forState:UIControlStateNormal];
    c.frame = CGRectMake(70.0, 300.0, 30.0, 30.0);
    [self.view addSubview:c];
    
    UIButton *d = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [d addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [d setTitle:@"D" forState:UIControlStateNormal];
    d.frame = CGRectMake(100.0, 300.0, 30.0, 30.0);
    [self.view addSubview:d];
    
    UIButton *e = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [e addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [e setTitle:@"E" forState:UIControlStateNormal];
    e.frame = CGRectMake(130.0, 300.0, 30.0, 30.0);
    [self.view addSubview:e];

    UIButton *f = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [f addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [f setTitle:@"F" forState:UIControlStateNormal];
    f.frame = CGRectMake(160.0, 300.0, 30.0, 30.0);
    [self.view addSubview:f];
    
    UIButton *g = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [g addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [g setTitle:@"G" forState:UIControlStateNormal];
    g.frame = CGRectMake(190.0, 300.0, 30.0, 30.0);
    [self.view addSubview:g];
    
    UIButton *h = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [h addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [h setTitle:@"H" forState:UIControlStateNormal];
    h.frame = CGRectMake(220.0, 300.0, 30.0, 30.0);
    [self.view addSubview:h];
    
    UIButton *i = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [i addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [i setTitle:@"I" forState:UIControlStateNormal];
    i.frame = CGRectMake(250.0, 300.0, 30.0, 30.0);
    [self.view addSubview:i];
    
    UIButton *j = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [j addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [j setTitle:@"J" forState:UIControlStateNormal];
    j.frame = CGRectMake(280.0, 300.0, 30.0, 30.0);
    [self.view addSubview:j];
    
    UIButton *k = [[UIButton alloc]init];
    //a.backgroundColor = [UIColor blackColor];
    [k addTarget:self
          action:@selector(guess:)
forControlEvents:UIControlEventTouchDown];
    [k setTitle:@"K" forState:UIControlStateNormal];
    k.frame = CGRectMake(10.0, 330.0, 30.0, 30.0);
    [self.view addSubview:k];
}

- (void) guess: (id)sender
{
    /*if(sender.title == @"A")
    {
        NSLog(@"Right");
    }*/
}

- (void) loadLengthWord: (int) lengthWord
{
    int spaceBetweenChars = 0;
    for(int x = 0; x < lengthWord; x++)
    {
        UILabel *guessLetter = [[UILabel alloc]init];
        guessLetter.textColor = [UIColor whiteColor];
        guessLetter.frame = CGRectMake(40 + spaceBetweenChars, 250, 30, 30);
        [guessLetter setText:@"_"];
        [self.view addSubview:guessLetter];
        spaceBetweenChars = spaceBetweenChars+30;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
