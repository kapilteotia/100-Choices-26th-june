//
//  PageContentViewController.h
//  100Choices
//
//  Created by Kapil Teotia on 10/06/14.
//  Copyright (c) 2014 Vertax_Web_Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@property (strong, nonatomic) IBOutlet UIScrollView *ImageScrollview;

@end
