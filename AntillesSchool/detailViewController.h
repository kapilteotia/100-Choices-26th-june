//
//  detailViewController.h
//  100Choices
//
//  Created by Kapil Teotia on 10/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import "AppDelegate.h"
@interface detailViewController : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) IBOutlet UIScrollView *ImageScrollview;
@property (strong, nonatomic) IBOutlet UILabel *productnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *productTypelbl;
@property (strong, nonatomic) IBOutlet UILabel *Pricelbl;
@property (strong, nonatomic)IBOutlet UIButton *colorbutton;
@property (strong, nonatomic)NSMutableArray *dataarray;
@property (strong, nonatomic)NSMutableDictionary *cartdataildic;
@property (strong, nonatomic) IBOutlet UIButton *Addtocartbtn;
@property (strong, nonatomic)  NSDictionary *dictionary;
-(IBAction)Addcart:(id)sender;
-(IBAction)ShowColor:(id)sender;
- (IBAction)startWalkthrough:(id)sender;
@end
