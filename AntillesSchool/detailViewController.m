//
//  detailViewController.m
//  100Choices
//
//  Created by Kapil Teotia on 10/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import "detailViewController.h"
#import "DetailColorViewController.h"

@interface detailViewController ()
{
    DetailColorViewController *Colorview;
    AppDelegate *ap;
}

@end

@implementation detailViewController
@synthesize ImageScrollview,dataarray,cartdataildic;


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
    // image to color button
    [self.colorbutton setBackgroundImage:[UIImage imageNamed:@"Select_color_buttondwn.png"] forState:UIControlStateNormal];
    
    
    ap=[[UIApplication sharedApplication]delegate];
    ap.cartarry=[[NSMutableArray alloc]init];
    
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"selected.png", @"selected.png", @"selected.png", @"selected.png"];

    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, 320,362);
    
    [ImageScrollview setContentSize:CGSizeMake(320,1200)];
    [self addChildViewController:_pageViewController];
    [self.ImageScrollview addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    // Do any additional setup after loading the view.
    
   //loading color XIB
    Colorview=[[DetailColorViewController alloc]initWithNibName:@"DetailColorViewController" bundle:[NSBundle mainBundle]];
    [self.colorbutton setBackgroundImage:[UIImage imageNamed:@"selct clr.png"] forState:UIControlStateNormal];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


-(IBAction)ShowColor:(id)sender
{
    [self.colorbutton setBackgroundImage:[UIImage imageNamed:@"Select_color_buttonup.png"] forState:UIControlStateNormal];
   // [];
    Colorview=[[DetailColorViewController alloc]initWithNibName:@"DetailColorViewController" bundle:nil];
    [Colorview.view setFrame:CGRectMake(60, 200, Colorview.view.frame.size.width, Colorview.view.frame.size.height)];
    
     
    [self.ImageScrollview addSubview:[Colorview view]];
}
-(IBAction)Addcart:(id)sender;
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

@end
