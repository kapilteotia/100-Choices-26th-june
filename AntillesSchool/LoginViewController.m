//
//  LoginViewController.m
//  100Choices
//
//  Created by SUMIT SUMAN on 13/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginView,txtLastName,
txtPhone,
txtLandlineNo,
txtEmail,
txtPassword,
txtConfirmPassword,
txtAddress,
txtPincode,txtFirstName,
txtCity;
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
    UIBarButtonItem *DoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(Done)];
    self.navigationItem.rightBarButtonItem = DoneButton;
    [loginView setContentSize:CGSizeMake(320, 600)];
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGFloat y = textField.frame.origin.y;
    if (y >= 300)
    {
        CGRect frame = self.view.frame;
        frame.origin.y = 320 - textField.frame.origin.y;
        [UIView animateWithDuration:0.3 animations:^{self.view.frame = frame;}];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect returnframe =self.view.frame;
    returnframe.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^{self.view.frame = returnframe;}];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Done
{
    if (txtFirstName.text.length==0 )
             {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"fill all field" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"ok",nil];
        [alert show];
    }
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

@end
