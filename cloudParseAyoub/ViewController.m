//
//  ViewController.m
//  cloudParseAyoub
//
//  Created by Ayoub Khayati on 18/11/13.
//  Copyright (c) 2013 Ayoub Khayati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSString *playerName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard:(id)sender{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

-(IBAction)createAction:(id)sender{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameTextField.text;
    newUser.email    = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL suceeded, NSError *error){
        if (!error) {
            self.messageBox.text = @"New user created, a verification email is sent!";
        }else{
            self.messageBox.text = [error userInfo][@"error"];
        }
    }];
}

-(IBAction)loginAction:(id)sender{
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error){
        if (user) {
            self.messageBox.text = [NSString stringWithFormat:@"User %@ is logged",user.username];
        }else {
            self.messageBox.text = [error userInfo][@"error"];
        }
    }];
}

-(IBAction)facebookLoginAction:(id)sender{
    NSArray *permissions = [NSArray arrayWithObjects:@"user_photos",@"user_videos",@"publish_stream",@"offline_access",@"user_checkins",@"friends_checkins",@"email",@"user_location" ,nil];
    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user , NSError *error){
        if (!user) {
            self.messageBox.text = (@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            self.messageBox.text =(@"User signed up and logged in through Facebook!");
        } else {
            self.messageBox.text =(@"User logged in through Facebook!");
        }
    }];
}

-(IBAction)twitterLoginAction:(id)sender{
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
