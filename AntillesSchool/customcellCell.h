//
//  customcellCell.h
//  ktable
//
//  Created by ugs on 4/16/13.
//  Copyright (c) 2013 ugs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customcellCell : UITableViewCell
{
    UILabel *lbl;
    UIImageView *imgview;
}
@property(strong,nonatomic)UILabel *item_namelbl,*item_Typelbl,*lbl3,*item_Colorlbl,*lbl5,*lbl6,*item_Pricelbl,*item_Quantitylbl;
@property(strong,nonatomic)UIImageView *imgview;
@end
