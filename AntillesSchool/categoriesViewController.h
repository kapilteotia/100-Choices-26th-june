//
//  categoriesViewController.h
//  100Choices
//
//  Created by Kapil Teotia on 09/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface categoriesViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *categoriescollection;
@property (strong, nonatomic)NSMutableArray *categoriesimage;
@property (strong, nonatomic)NSMutableArray *categoriesname;
@property (strong, nonatomic) NSString *id1;
@end
