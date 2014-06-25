//
//  AlreadyAnUserViewController.m
//  100Choices
//
//  Created by SUMIT SUMAN on 13/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "AlreadyAnUserViewController.h"

@interface AlreadyAnUserViewController ()

@end

@implementation AlreadyAnUserViewController
@synthesize txtEmail,txtPassword;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

- (IBAction)doneBtn:(id)sender
{
    if (txtPassword.text.length<=0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Field's can't be blank." delegate:self cancelButtonTitle:Nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}


@end
