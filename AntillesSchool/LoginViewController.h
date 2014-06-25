//
//  LoginViewController.h
//  100Choices
//
//  Created by SUMIT SUMAN on 13/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lblFirstName;
@property (strong, nonatomic) IBOutlet UILabel *lblLastName;


@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;

@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtLandlineNo;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtPincode;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UIScrollView *loginView;

@end
