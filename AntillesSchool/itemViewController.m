//
//  itemViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 09/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "itemViewController.h"
#import "detailViewController.h"
#import "RefineViewController.h"

@interface itemViewController ()

@end

@implementation itemViewController
@synthesize itemImageArray,itemNameArray,itemPriceArray,itemTypeArray;

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
    // adding images to data array
    itemImageArray=[[NSMutableArray alloc]initWithObjects:@"g11.png",@"g12.png",@"g13.png",@"g14.png", @"g15.png",@"g16.png",nil];
    
    // adding name to name array
    itemNameArray=[[NSMutableArray alloc]initWithObjects:@"Dress",@"Shirt",@"Paint",@"suit",@"Froks",@"Shirt", nil];
    
   // adding item type to name array
    itemTypeArray=[[NSMutableArray alloc]initWithObjects:@"Dress",@"Shirt",@"Paint",@"suit",@"Froks",@"Shirt", nil];
    
    // adding price to name array
    itemPriceArray=[[NSMutableArray alloc]initWithObjects:@"23",@"34",@"65",@"76",@"45",@"45", nil];
    
    //adding navigation item button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refine"
                                                                              style:self.editButtonItem.style
                                                                             target:self
                                                                             action:@selector(refine)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:1101];
    recipeImageView.image = [UIImage imageNamed:[itemImageArray objectAtIndex:indexPath.row]];
    
    UILabel *itemName=(UILabel *)[cell viewWithTag:1102];
    itemName.text=[itemNameArray objectAtIndex:indexPath.row];
    [itemName setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.5f]];
    
    UILabel *itemType=(UILabel *)[cell viewWithTag:1103];
    itemType.text=[itemTypeArray objectAtIndex:indexPath.row];
    [itemType setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.5f]];
    
    UILabel *itemPrice=(UILabel *)[cell viewWithTag:1104];
    itemPrice.text=[itemPriceArray objectAtIndex:indexPath.row];
    [itemPrice setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.5f]];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    detailViewController *items=[[detailViewController alloc] init];
    items=(detailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    //categories.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:items animated:YES];
}
-(void)refine
{
    RefineViewController *refine=[[RefineViewController alloc] init];
    refine=(RefineViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"RefineViewController"];
    //categories.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:refine animated:YES];
    
    
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
