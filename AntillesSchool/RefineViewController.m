//
//  RefineViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 19/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "RefineViewController.h"

@interface RefineViewController ()

@end

@implementation RefineViewController
@synthesize refinetable,refineitem,Sortbybtn,Colorbtn,Discount;

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
    //adding tableview
    refinetable=[[UITableView alloc]initWithFrame:CGRectMake(50, 200, 200, 200)];
    [self.view addSubview:refinetable];
    
    //adding array;
    refineitem=[[NSMutableArray alloc]init];
    refinetable.delegate=self;
    refinetable.dataSource=self;
    refinetable.hidden=YES;
    // Do any additional setup after loading the view.
}
-(IBAction)Sortbybtn:(UIButton *)sender
{
  
    if ([sender tag] == 1)
    {
        
       [refineitem removeAllObjects];
        NSMutableArray *shortarray=[[NSMutableArray alloc]initWithObjects:@"Popularity",@"What's New",@"Price: Low to High" ,@"Price: High to Low",nil];
         [refineitem addObjectsFromArray:shortarray];
        [sender setBackgroundImage:[UIImage imageNamed:@"dropdown2.png"] forState:UIControlStateNormal];
        [refinetable reloadData];
        refinetable.hidden=NO;
         // refinetable=nil;
        NSLog(@"short");
    }
    if ([sender tag] == 2)
    {
        [refineitem removeAllObjects];
         [sender setBackgroundImage:[UIImage imageNamed:@"dropdown2.png"] forState:UIControlStateNormal];
        NSMutableArray *shortarray1=[[NSMutableArray alloc]initWithObjects:@"Red",@"Green",@"Black" ,@"Blue",nil];
        [refineitem addObjectsFromArray:shortarray1];
        
        [refinetable reloadData];
        refinetable.hidden=NO;

        NSLog(@"color");

    }
    
    if ([sender tag] == 3)
    {
        NSLog(@"brand");
    }
    if ([sender tag] == 4)
    {
        NSLog(@"price");
        
    }
    if ([sender tag] == 5)
    {
        [refineitem removeAllObjects];
         [sender setBackgroundImage:[UIImage imageNamed:@"dropdown2.png"] forState:UIControlStateNormal];
        NSMutableArray *shortarray1=[[NSMutableArray alloc]initWithObjects:@"Discounted Item",@"Non Discounted Item",nil];
        [refineitem addObjectsFromArray:shortarray1];
        [refinetable setFrame:CGRectMake(50, 200, 200, 100)];
        [refinetable reloadData];
        refinetable.hidden=NO;
        NSLog(@"discount");
        
    }


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [refineitem count];
    
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[refineitem objectAtIndex:indexPath.row];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [Sortbybtn setBackgroundImage:[UIImage imageNamed:@"dropdown3.png"] forState:UIControlStateNormal];
    [Colorbtn setBackgroundImage:[UIImage imageNamed:@"dropdown3.png"] forState:UIControlStateNormal];
    [Discount setBackgroundImage:[UIImage imageNamed:@"dropdown3.png"] forState:UIControlStateNormal];

    refinetable.hidden=YES;
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

@end
