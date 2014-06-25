//
//  ToDoViewController.m
//  AntillesSchool
//
//  Created by Vertax-iMac on 18/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import "ToDoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
//#import "TPKeyboardAvoidingScrollView.h"
#import "ProgressHUD.h"
#import "customReusableview.h"
#import "categoriesViewController.h"

@interface ToDoViewController ()


@end


@implementation ToDoViewController
@synthesize scrollview,menuCollectionView,dataarray,namearray,brand1,brand2,brand3,brand4,brand5,brand6,brand7,brand8,bannerimg;


- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] init];
   [imageView setFrame:CGRectMake(0, 0, 100, 30)];
    [imageView setImage:[UIImage imageNamed:@"logo1.png"]];
    [self.navigationController.navigationBar.topItem setTitleView:imageView];
    
    
    
    //seting collection view background color
  //  [menuCollectionView setFrame:CGRectMake(0, 0, 320, (namearray.count))];
    [menuCollectionView setBackgroundColor:[UIColor whiteColor]];
    
    
    //setting content size of scroll view
    [scrollview setContentSize:CGSizeMake(320, 900)];

    // adding images to data array
    dataarray=[[NSMutableArray alloc]initWithObjects:@"h1.png",@"h2.png",@"h5.png",@"h3.png",@"h4.png",@"h6.png",nil];
    
    
    // adding name to name array
    namearray=[[NSMutableArray alloc]initWithObjects:@"Women",@"Fashion",@"Sport",@"Kids",@"Men",@"New Arival", nil];

    //adding banner at bottom
    bannerimg=[[UIImageView alloc]initWithFrame:CGRectMake(10, ((((namearray.count)/3)*110)+180), 298, 100)];
    [bannerimg setImage:[UIImage imageNamed:@"hbanner.png"]];
    [self.scrollview addSubview:bannerimg];
    
    //adding brand brand button
    brand1=[[UIButton alloc]initWithFrame:CGRectMake(8, ((((namearray.count)/3)*110)+300), 76, 55)];
    [brand1 setBackgroundColor:[UIColor blueColor]];
    [brand1 setBackgroundImage:[UIImage imageNamed:@"nike.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand1];
    
    brand2=[[UIButton alloc]initWithFrame:CGRectMake(83, ((((namearray.count)/3)*110)+300), 76, 55)];
    [brand2 setBackgroundColor:[UIColor blueColor]];
    [brand2 setBackgroundImage:[UIImage imageNamed:@"only.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand2];
    
    brand3=[[UIButton alloc]initWithFrame:CGRectMake(158, ((((namearray.count)/3)*110)+300), 76, 55)];
    [brand3 setBackgroundColor:[UIColor blueColor]];
    [brand3 setBackgroundImage:[UIImage imageNamed:@"puma.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand3];
    
    brand4=[[UIButton alloc]initWithFrame:CGRectMake(8, ((((namearray.count)/3)*110)+354), 76, 55)];
    [brand4 setBackgroundColor:[UIColor blueColor]];
    [brand4 setBackgroundImage:[UIImage imageNamed:@"rayban.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand4];
    
    brand5=[[UIButton alloc]initWithFrame:CGRectMake(83,  ((((namearray.count)/3)*110)+354), 76, 55)];
    [brand5 setBackgroundColor:[UIColor blueColor]];
    [brand5 setBackgroundImage:[UIImage imageNamed:@"rayban.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand5];
    
    brand6=[[UIButton alloc]initWithFrame:CGRectMake(158,  ((((namearray.count)/3)*110)+354), 76, 55)];
    [brand6 setBackgroundColor:[UIColor blueColor]];
    [brand6 setBackgroundImage:[UIImage imageNamed:@"puma.png"] forState:UIControlStateNormal];
    [self.scrollview addSubview:brand6];
    
    brand7=[[UIButton alloc]initWithFrame:CGRectMake(233, ((((namearray.count)/3)*110)+300), 76, 55)];
    [brand7 setBackgroundImage:[UIImage imageNamed:@"only.png"] forState:UIControlStateNormal];
    
    [brand7 setBackgroundColor:[UIColor blueColor]];
    [self.scrollview addSubview:brand7];
    
    brand8=[[UIButton alloc]initWithFrame:CGRectMake(233, ((((namearray.count)/3)*110)+354), 76, 55)];
    [brand8 setBackgroundImage:[UIImage imageNamed:@"nike.png"] forState:UIControlStateNormal];
    
    
    [self.scrollview addSubview:brand8];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Add a shadow to the top view so it looks like it is on top of the others
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    //create the image for your button, and set the frame for its size
    
    UIImage *image = [UIImage imageNamed:@"menu_1.png"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(refreshLogsAction) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];

    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
        
        [(MenuViewController *)self.slidingViewController.underLeftViewController setDelegate:(id)self];
    }
    
    
    
    
    
    // Add the pan gesture to allow sliding
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    
         }
-(void)refreshLogsAction
{
    [self.slidingViewController anchorTopViewTo:ECRight];

}
#pragma mark - Tableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSDictionary *currentCategory = self.toDoCategories[self.selectedCategory];
//    return [currentCategory[@"items"] count];
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    return cell;
}

#pragma mark - MenuViewController Delegate

- (void)menuViewControllerDidFinishWithCategoryId:(NSInteger)categoryId
{
    self.selectedCategory = categoryId;
    self.navigationTitle.title = self.toDoCategories[self.selectedCategory][@"title"];
    [self.slidingViewController resetTopView];
}

- (IBAction)barbutton_clicked:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)login_btn_clicked:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        
        // After this task is done switch back to main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [ProgressHUD show:@"Please wait..."];
        });
        
    });
    [self performSelector:@selector(dismissprograsshud) withObject:nil afterDelay:2.0f];
    
}
#pragma mark- Collection view Delegates
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [dataarray count];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        customReusableview *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        // NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%i", indexPath.section + 1];
        // headerView.title.text = title;
        //UIImage *headerImage = [UIImage imageNamed:@"cell_bg.png"];
        [headerView.reuseImageView setBackgroundColor:[UIColor purpleColor]];
        
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
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0,90, 80, 20)];
    [lbl setText:[namearray objectAtIndex:indexPath.row] ];
    [cell setTag:indexPath.row];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.5f]];
    [cell.contentView addSubview:lbl];
    // image view
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 90) ];
    [imageview setImage:[UIImage imageNamed:[dataarray objectAtIndex:indexPath.row]]];
    [cell.contentView addSubview:imageview];
       // cell.backgroundColor=[UIColor greenColor];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    categoriesViewController *categories=[[categoriesViewController alloc] init];
    categories=(categoriesViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"categoriesViewController"];
    if (indexPath.row==0)
    {
        categories.id1=@"a";
    }
    

    
    //categories.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:categories animated:YES];

}


 



#pragma mark- Textfield Delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)dismissprograsshud
{
    [ProgressHUD dismiss];
}



@end