//
//  ToDoViewController.h
//  AntillesSchool
//
//  Created by Vertax-iMac on 18/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@class TPKeyboardAvoidingScrollView;
@interface ToDoViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,MenuViewControllerDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UINavigationItem *navigationTitle;
@property (nonatomic, strong) NSArray *toDoCategories;
@property (nonatomic, assign) NSInteger selectedCategory;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UICollectionView *menuCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *todoBarButton;

@property (strong, nonatomic)NSMutableArray *dataarray;
@property (strong, nonatomic)NSMutableArray *namearray;
@property(strong,nonatomic)UIButton *brand1,*brand2,*brand3,*brand4,*brand5,*brand6,*brand7,*brand8;
@property(strong,nonatomic)UIImageView *bannerimg;
- (IBAction)barbutton_clicked:(id)sender;
- (IBAction)login_btn_clicked:(id)sender;
@end
