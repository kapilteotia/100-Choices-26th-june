//
//  InitialSlidingViewController.m
//  AntillesSchool
//
//  Created by Vertax-iMac on 18/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import "InitialSlidingViewController.h"

@interface InitialSlidingViewController ()

@end

@implementation InitialSlidingViewController

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
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBar"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
