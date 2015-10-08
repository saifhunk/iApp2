//
//  FriendListViewController.h
//  iApp
//
//  Created by Saif Chaudhary on 10/9/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendListTableViewCell.h"

@interface FriendListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *actionBtnSidepanel;
- (IBAction)actionBtnSidePanel:(id)sender;
@end
