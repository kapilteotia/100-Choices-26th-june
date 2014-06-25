//
//  cartViewController.h
//  100Choices
//
//  Created by Kapil Teotia on 11/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@class LoginViewController;

@interface cartViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
@property(strong,nonatomic)NSMutableArray *dataarray,*Pricearray;
@property (strong, nonatomic) IBOutlet UIScrollView *cartScrollView;
@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic)UILabel *subtotallbl,*subtotalvaluelbl,*shippinglbl,*shippingvaluelbl,*totallbl,*totalvaluelbl,*rslbl;
@property (strong, nonatomic)NSString *pricestr,*totalpricestr;
@property (strong, nonatomic)UIButton *ordernowbtn;
@property (strong, nonatomic)UIActionSheet *loginactionsheet;
@property (strong, nonatomic)UILabel *noItemlbl;
@property(strong,nonatomic)NSMutableDictionary *dictionary;
@end
