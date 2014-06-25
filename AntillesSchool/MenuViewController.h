//
//  MenuViewController.h
//  AntillesSchool
//
//  Created by Vertax-iMac on 18/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@protocol MenuViewControllerDelegate;

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UINavigationBarDelegate>
{


}
@property (nonatomic, strong) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, strong) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *categoryList;
@property (strong, nonatomic) NSMutableArray *dataList;

@property (strong, nonatomic) IBOutlet UITableView *menuTable;

@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;
//@property (strong, nonatomic) IBOutlet NSMutableArray *dataList;
@property (strong, nonatomic) IBOutlet UIButton *btn_FromList;
@property (strong, nonatomic) IBOutlet UIButton *btn_AddMenually;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView_SegmentBtns;
@property (strong, nonatomic) IBOutlet UIView *view_TableView_List;
@property (strong, nonatomic) IBOutlet UITextField *textview_excerciseName_text;
@property (strong, nonatomic) IBOutlet UIButton *btn_AddNewExcercise;
@property (strong, nonatomic) IBOutlet UITableView *tableView_AddExcercise;
@property (nonatomic, strong) NSMutableArray *selectedCells;
@property(nonatomic,strong) NSArray *items;
@property (nonatomic, retain) NSMutableArray *itemsInTable;


@end

@protocol MenuViewControllerDelegate
-(void)menuViewControllerDidFinishWithCategoryId:(NSInteger)categoryId;

@end

