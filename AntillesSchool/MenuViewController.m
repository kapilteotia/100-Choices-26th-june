//
//  MenuViewController.m
//  AntillesSchool
//
//  Created by Vertax-iMac on 18/10/13.
//  Copyright (c) 2013 Vertax_Web_Technologies. All rights reserved.
//

#import "MenuViewController.h"
#import "ECSlidingViewController.h"
#import "CustomCell.h"

@interface MenuViewController()
{
    NSString *Images;
}
@end

@implementation MenuViewController
@synthesize dataList,menuTable;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.slidingViewController setAnchorRightRevealAmount:190.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    self.navigationController.navigationBar.translucent = YES;
    [menuTable setBackgroundColor:[UIColor clearColor]];
    NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data1" ofType:@"plist"]];
	self.items=[dict valueForKey:@"Items"];
	self.itemsInTable=[[NSMutableArray alloc] init];
	[self.itemsInTable addObjectsFromArray:self.items];
    

    
}

#pragma mark - Tableview DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemsInTable count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 43;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Title= [[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Name"];
    
     Images= [[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Image"];
    
    


    
    return [self createCellWithTitle:Title image:[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"level"] indexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic=[self.itemsInTable objectAtIndex:indexPath.row];
    if([dic valueForKey:@"Name"])
    {
        NSArray *arr=[dic valueForKey:@"SubItems"];
        BOOL isTableExpanded=NO;
        
        for(NSDictionary *subitems in arr )
        {
              NSLog(@"cick4");
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        if(isTableExpanded)
        {
            
            NSLog(@"cick1");
            [self CollapseRows:arr];
        }
        else
        {
              NSLog(@"cick2");
            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                 NSLog(@"cick3");
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTable insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

-(void)CollapseRows:(NSArray*)ar
{
	for(NSDictionary *dInner in ar )
    {
		NSUInteger indexToRemove=[self.itemsInTable indexOfObjectIdenticalTo:dInner];
		NSArray *arInner=[dInner valueForKey:@"SubItems"];
		if(arInner && [arInner count]>0)
        {
            NSLog(@"ncick1");

			[self CollapseRows:arInner];
		}
		
		if([self.itemsInTable indexOfObjectIdenticalTo:dInner]!=NSNotFound)
        {
            NSLog(@"ncick1");

			[self.itemsInTable removeObjectIdenticalTo:dInner];
			[self.menuTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:
                                                        [NSIndexPath indexPathForRow:indexToRemove inSection:0]
                                                        ]
                                      withRowAnimation:UITableViewRowAnimationLeft];
        }
	}
}

- (UITableViewCell*)createCellWithTitle:(NSString *)title image:(UIImage *)image  indexPath:(NSIndexPath*)indexPath
{
    NSString *CellIdentifier = @"Cell";
    CustomCell* cell = [self.menuTable dequeueReusableCellWithIdentifier:CellIdentifier];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor grayColor];
    [cell.menuLable_MenuName setFont:[UIFont fontWithName:@"Helvetica" size:13]];

    cell.selectedBackgroundView = bgView;
    cell.menuLable_MenuName.text = title;
    
    [cell.menuImageView_Icons setImage:[UIImage imageNamed:Images]];
   // cell.menuImageView_Icons.image=[UIImage imageNamed:image1];
    cell.menuLable_MenuName.textColor = [UIColor blackColor];
    
    [cell setIndentationLevel:[[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"level"] intValue]];
    cell.indentationWidth = 25;
    
    float indentPoints = cell.indentationLevel * cell.indentationWidth;
    
    cell.contentView.frame = CGRectMake(indentPoints,cell.contentView.frame.origin.y,cell.contentView.frame.size.width - indentPoints,cell.contentView.frame.size.height);
    
    NSDictionary *d1=[self.itemsInTable objectAtIndex:indexPath.row] ;
    
    if([d1 valueForKey:@"SubItems"])
    {
   //     cell.btnExpand.alpha = 1.0;
    //    [cell.btnExpand addTarget:self action:@selector(showSubItems:) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
  //  cell.btnExpand.alpha = 0.0;
    }
    return cell;
}

-(void)showSubItems :(id) sender
{
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.menuTable];
    NSIndexPath *indexPath = [self.menuTable indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    if(btn.alpha==1.0)
    {
        if ([[btn imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"down-arrow.png"]])
        {
            [btn setImage:[UIImage imageNamed:@"up-arrow.png"] forState:UIControlStateNormal];
        }
        else
        {
            [btn setImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateNormal];
        }
        
    }
    
    NSDictionary *d=[self.itemsInTable objectAtIndex:indexPath.row] ;
    NSArray *arr=[d valueForKey:@"SubItems"];
    if([d valueForKey:@"SubItems"])
    {
        BOOL isTableExpanded=NO;
        for(NSDictionary *subitems in arr )
        {
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        if(isTableExpanded)
        {
           
            [self CollapseRows:arr];
        }
        else
        {
            NSLog(@"ncick2");

            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTable insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}
/*- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, 10)];
    v.backgroundColor = [UIColor clearColor];
    [tableView setTableHeaderView:v];
    [tableView setTableFooterView:v];
    return v;
}*/
@end