//
//  RefineViewController.h
//  100Choices
//
//  Created by Kapil Teotia on 19/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *refinetable;
@property (strong, nonatomic) IBOutlet UIButton *Sortbybtn;
@property (strong, nonatomic) IBOutlet UIButton *Colorbtn;
@property (strong, nonatomic) IBOutlet UIButton *Brandbtn;
@property (strong, nonatomic) IBOutlet UIButton *Price;
@property (strong, nonatomic) IBOutlet UIButton *Discount;
@property (strong, nonatomic)NSMutableArray *refineitem;
-(IBAction)Sortbybtn:(id)sender;
/*-(IBAction)Colorbtn:(id)sender;
-(IBAction)Brandbtn:(id)sender;
-(IBAction)Price:(id)sender;
-(IBAction)Discount:(id)sender;*/
@end
