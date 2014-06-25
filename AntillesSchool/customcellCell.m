//
//  customcellCell.m
//  ktable
//
//  Created by ugs on 4/16/13.
//  Copyright (c) 2013 ugs. All rights reserved.
//

#import "customcellCell.h"

@implementation customcellCell
@synthesize imgview,item_namelbl,item_Typelbl,lbl3,item_Colorlbl,lbl5,lbl6,item_Pricelbl,item_Quantitylbl;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        item_namelbl=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 50, 20)];
        [item_namelbl setText:@"kapil"];
        [self.contentView addSubview:item_namelbl];
        item_Typelbl=[[UILabel alloc]initWithFrame:CGRectMake(120, 25, 40, 20)];
        [item_Typelbl setText:@"kapil"];
        [item_Typelbl setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
        [self.contentView addSubview:item_Typelbl];
        
        lbl3=[[UILabel alloc]initWithFrame:CGRectMake(120, 55, 40, 20)];
        [lbl3 setText:@"Color:"];
        [lbl3 setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:lbl3];
        
        item_Colorlbl=[[UILabel alloc]initWithFrame:CGRectMake(165, 55, 40, 20)];
        [item_Colorlbl setText:@"White"];
        [item_Colorlbl setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:item_Colorlbl];
        
        lbl5=[[UILabel alloc]initWithFrame:CGRectMake(120, 80, 50, 20)];
        [lbl5 setText:@"Quantity:"];
        [lbl5 setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:lbl5];
        
        item_Quantitylbl=[[UILabel alloc]initWithFrame:CGRectMake(175, 80, 40, 20)];
        [item_Quantitylbl setText:@"1"];
        [item_Quantitylbl setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:item_Quantitylbl];
        
        
        
        lbl6=[[UILabel alloc]initWithFrame:CGRectMake(220, 80, 50, 20)];
        [lbl6 setText:@"Rs"];
        [lbl6 setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:lbl6];
        
        item_Pricelbl=[[UILabel alloc]initWithFrame:CGRectMake(255, 80, 40, 20)];
        
        [item_Pricelbl setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [self.contentView addSubview:item_Pricelbl];
        
        imgview=[[UIImageView alloc]initWithFrame:CGRectMake(2, 3, 110, 92)];
         imgview.image=[UIImage imageNamed:@"1.png"];
        [self.contentView addSubview:imgview];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
