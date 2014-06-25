//
//  CustomCell.m
//  AntillesSchool
//
//  Created by Vertax-iMac on 22/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize menuImageView_Icons,menuLable_MenuName;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [menuLable_MenuName setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
