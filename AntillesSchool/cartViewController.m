//
//  cartViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 11/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "cartViewController.h"
#import "customcellCell.h"
#import "LoginViewController.h"
#import "AlreadyAnUserViewController.h"

@interface cartViewController ()
{
    
    
    
    int i;
}
@end

@implementation cartViewController
@synthesize dataarray,table,subtotalvaluelbl,shippinglbl,shippingvaluelbl,totallbl,totalvaluelbl,subtotallbl,Pricearray,pricestr,ordernowbtn,loginactionsheet,totalpricestr,rslbl,noItemlbl;


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
    //addind scrol view
    dataarray=[[NSMutableArray alloc]initWithObjects:@"kapil",@"malik",@"deepak",@"amit",nil];
    
    self.cartScrollView.scrollEnabled=YES;
    [self.cartScrollView setContentSize:CGSizeMake(320, (100*(dataarray.count)+150))];
    
    // array for cart table item
    //  dataarray=[[NSMutableArray alloc]initWithObjects:@"kapil",@"kapil",nil];
    
    //array to ad price
    Pricearray=[[NSMutableArray alloc]initWithObjects:@"2",@"3",@"12",@"10",nil];
    
    i=0;
    
    
    // adding badge on cart tabbar item
    UITabBarItem *tbi = (UITabBarItem *)self.tabBarController.selectedViewController.tabBarItem;
    NSString *str=[NSString stringWithFormat:@"%ld",(unsigned long)dataarray.count];
    tbi.badgeValue = str;
    
    // adding table to shown cart item
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320,((dataarray.count*100)+65))];
    [self.cartScrollView addSubview:table];
    table.scrollEnabled=NO;
    table.delegate=self;
    table.dataSource=self;
    
    
    // adding label to to shoe sub total
    subtotallbl=[[UILabel alloc]initWithFrame:CGRectMake(120, ((dataarray.count*100)+30), 90, 30)];
    [subtotallbl setText:@"Total"];
    [subtotallbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [subtotallbl setTextColor:[UIColor grayColor]];
    [self.cartScrollView addSubview:subtotallbl];
    
    
    //rs label
    rslbl=[[UILabel alloc]initWithFrame:CGRectMake(220, ((dataarray.count*100)+30), 25, 30)];
    [rslbl setText:@"Rs-"];
    [rslbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:13]];
    [rslbl setTextColor:[UIColor grayColor]];
    [self.cartScrollView addSubview:rslbl];
    
    // adding label to to shoe sub total value
    subtotalvaluelbl=[[UILabel alloc]initWithFrame:CGRectMake(245, ((dataarray.count*100)+30), 70, 30)];
    //  [subtotalvaluelbl setText:@"299.00"];
    [subtotalvaluelbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:13]];
    [subtotalvaluelbl setTextColor:[UIColor grayColor]];
    [self.cartScrollView addSubview:subtotalvaluelbl];
    
    //adding button to take order
    ordernowbtn=[[UIButton alloc]initWithFrame:CGRectMake(50, ((dataarray.count*100)+70), 200, 30)];
    [ordernowbtn setBackgroundImage:[UIImage imageNamed:@"order_now.png"] forState:UIControlStateNormal];
    [self.cartScrollView addSubview:ordernowbtn];
    //action to button
    [ordernowbtn addTarget:self
                    action:@selector(myAction)
          forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //adding action sheet to add login table
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0,320, self.cartScrollView.frame.size.height)];
    [view1 setBackgroundColor:[UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:0.3]];
    // [self.cartScrollView addSubview:view1];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [dataarray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    customcellCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[customcellCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    
    
   cell.item_Pricelbl.text=[Pricearray objectAtIndex:indexPath.row];
    
    NSString *strprice=[ Pricearray objectAtIndex:indexPath.row];
    float prc = [strprice floatValue];
    i=i+prc;
    
    totalpricestr=[NSString stringWithFormat:@"%.2d",i];
    NSLog(@"value is %@",totalpricestr);
    [subtotalvaluelbl setText:[NSString stringWithFormat:@"%@",totalpricestr]];
    
    
    // NSLog(@"value is %d",i);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.imageView.image=[UIImage imageNamed:@"table_cell_bg.png"];
    [self.table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.dataarray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [table setFrame:CGRectMake(0, 0, 320,((dataarray.count*100)+60)) ];
        //UITabBarItem *tbi = (UITabBarItem *)self.tabBarController.selectedViewController.tabBarItem;
        
        // subtarcting price from array
        NSString *strprice1=[Pricearray objectAtIndex:indexPath.row];
        [Pricearray removeObjectAtIndex:indexPath.row];
        float prc = [strprice1 floatValue];
        i=i-prc;
        NSString *totalpricestr1=[NSString stringWithFormat:@"%.2d",i];
        NSLog(@"value is %@",totalpricestr1);
        [subtotalvaluelbl setText:[NSString stringWithFormat:@"%@",totalpricestr1]];
        
        if (i==00)
            
        {
            
            noItemlbl =[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];
            [noItemlbl setText:@"No Item In Cart"];
            [self.cartScrollView addSubview:noItemlbl];
            ordernowbtn.hidden=YES;
            rslbl.hidden=YES;
            subtotallbl.hidden=YES;
            subtotalvaluelbl.hidden=YES;
        }
        
        
        //adding badge value
        NSString *str=[NSString stringWithFormat:@"%ld",(unsigned long)dataarray.count];
        //tbi.badgeValue = str;
        self.tabBarController.selectedViewController.tabBarItem.badgeValue=str;
        if (dataarray.count==0)
        {
           self.tabBarController.selectedViewController.tabBarItem.badgeValue=Nil;        }
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//myaction method for ordernowbutton
-(IBAction)myAction
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Login" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            
                            @"New User",
                            @"Existing User",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self loginMethod];
                    break;
                case 1:
                    [self existingUserMethod];
                    break;
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}
-(void)loginMethod
{
    LoginViewController *newUserLogin = [[LoginViewController alloc]init];
    newUserLogin = (LoginViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:newUserLogin animated:YES];
}
-(void)existingUserMethod
{
    AlreadyAnUserViewController *existingUserLogin = [[AlreadyAnUserViewController alloc]init];
    existingUserLogin = (AlreadyAnUserViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"AlreadyAnUserViewController"];
    [self.navigationController pushViewController:existingUserLogin animated:YES];
}
@end
