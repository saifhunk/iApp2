//
//  RemoveCategoryViewController.h
//  iApp
//
//  Created by Saif Chaudhary on 9/20/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CategoryModal.h"
#import "WebviewViewController.h"

@protocol  DelegateRemoveCategory

-(void)DeleteClicked:(NSIndexPath *)indexpath;

@end

@interface RemoveCategoryViewController : UIViewController

@property(nonatomic,retain)id<DelegateRemoveCategory>Deleagte;
@property NSString * strHeader;
@property NSIndexPath * indexpath;
@property(nonatomic,strong)NSArray * arraylinks;
@property (weak, nonatomic) IBOutlet UILabel *labelHeading;
@property (weak, nonatomic) IBOutlet UITableView *tableViewWebsites;

-(void)getData:(CategoryModal *)Category :(NSIndexPath *)indexpath;

@end
