//
//  RemoveCategoryViewController.h
//  iApp
//
//  Created by Saif Chaudhary on 9/20/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@protocol  DelegateRemoveCategory

-(void)DeleteClicked:(NSIndexPath *)indexpath;

@end

@interface RemoveCategoryViewController : UIViewController

@property(nonatomic,retain)id<DelegateRemoveCategory>Deleagte;
@property NSString * strHeader;
@property NSIndexPath * indexpath;
@property (weak, nonatomic) IBOutlet UILabel *labelHeading;
@property (weak, nonatomic) IBOutlet UITableView *tableViewWebsites;

-(void)getData:(NSString *)strCategory :(NSIndexPath *)indexpath;

@end
