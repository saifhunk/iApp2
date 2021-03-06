//
//  SideMenuViewController.h
//  RealEstate1691
//
//  Created by Binit Vermani on 30/06/15.
//  Copyright (c) 2015 Binit Vermani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "RESideMenu.h"

@interface SideMenuViewController : UIViewController<UIScrollViewDelegate>

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIButton *btnProfile;
@property (weak, nonatomic) IBOutlet UIImageView *imageVIewProfile;


@property (weak, nonatomic) IBOutlet UIButton *btnAddPost;

@property (weak, nonatomic) IBOutlet UIButton *btnEyeWitness;
@property (weak, nonatomic) IBOutlet UIButton *btnJournalist;
@property (weak, nonatomic) IBOutlet UIButton *btnNotifiaction;
@property (weak, nonatomic) IBOutlet UIButton *btnSettings;
@property (weak, nonatomic) IBOutlet UIButton *btnFeed;
@property (weak, nonatomic) IBOutlet UIButton *btnFriendList;
@property (weak, nonatomic) IBOutlet UIButton *btnFollowList;
@property (weak, nonatomic) IBOutlet UIButton *BtnEditSubscription;


#pragma mark - button actions
- (IBAction)actionBtnFriendList:(id)sender;
- (IBAction)actionBtnFollowList:(id)sender;
- (IBAction)actionBtnEditSubscription:(id)sender;

- (IBAction)actionBtnFeed:(id)sender;

- (IBAction)actionBtnProfile:(id)sender;

- (IBAction)actionBtnAddPost:(id)sender;

- (IBAction)actionBtnEyeWitness:(id)sender;

- (IBAction)actionBtnJournalist:(id)sender;
- (IBAction)actionbtnNotifiaction:(id)sender;
- (IBAction)actionBtnSettings:(id)sender;

@end