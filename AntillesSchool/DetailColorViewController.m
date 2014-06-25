//
//  DetailColorViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 16/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "DetailColorViewController.h"
#import "detailViewController.h"

@interface DetailColorViewController ()

@end

@implementation DetailColorViewController
@synthesize dataarray;

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
        dataarray=[[NSMutableArray alloc]initWithObjects:@"Black",@"Blue",@"Green", nil];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataarray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[dataarray objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    detailViewController *detailview=[[detailViewController alloc]init];
    [detailview.colorbutton setBackgroundImage:[UIImage imageNamed:@"Select_color_buttondwn.png"] forState:UIControlStateNormal];

    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
