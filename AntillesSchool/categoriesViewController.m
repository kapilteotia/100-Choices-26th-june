//
//  categoriesViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 09/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "categoriesViewController.h"
#import "customReusableview.h"
#import "itemViewController.h"

@interface categoriesViewController ()

@end

@implementation categoriesViewController
@synthesize categoriescollection,categoriesimage,categoriesname,id1;

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
    NSLog(@"id is %@",id1);
    self.title=@"categories";
    [self item];
    // adding images to data array
       // Do any additional setup after loading the view.
}
-(void)item
{
    if ([id1 isEqualToString:@"a"])
    {
        categoriesimage=[[NSMutableArray alloc]initWithObjects:@"h1.png",@"beauti.png",@"jwelry.png",@"h1.png", @"shoes.png",@"sb ctgry2.png",nil];
        // adding name to name array
        categoriesname=[[NSMutableArray alloc]initWithObjects:@"Cloth",@"Beauty",@"Jewellry",@"Bags",@"Shoes",@"assories", nil];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

        // Dispose of any resources that can be recreated.
    
    

}

#pragma mark - MenuViewController Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [categoriesname count];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        customReusableview *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView1" forIndexPath:indexPath];
        
        reusableview = headerView;
    }
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //UILable to show name on cell.
    UILabel *lbl=(UILabel *)[cell viewWithTag:1106];
    [lbl setText:[categoriesname objectAtIndex:indexPath.row]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.5f]];
    
    // image view to show image in cell
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:1105];
    recipeImageView.image = [UIImage imageNamed:[categoriesimage objectAtIndex:indexPath.row]];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    itemViewController *items=[[itemViewController alloc] init];
    items=(itemViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"itemViewController"];
    //categories.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:items animated:YES];
    
}


@end
