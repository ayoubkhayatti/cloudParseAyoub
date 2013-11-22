//
//  ViewController.h
//  cloudParseAyoub
//
//  Created by Ayoub Khayati on 18/11/13.
//  Copyright (c) 2013 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UILabel *messageBox;

-(IBAction)createAction:(id)sender;
-(IBAction)loginAction:(id)sender;
-(IBAction)facebookLoginAction:(id)sender;
-(IBAction)twitterLoginAction:(id)sender;
@end
