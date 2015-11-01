//
//  SideMenuViewController.m
//  RealEstate1691
//
//  Created by Binit Vermani on 30/06/15.
//  Copyright (c) 2015 Binit Vermani. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()


@end

#pragma mark - View Hierarchy

@implementation SideMenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializeUI];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidAppear:(BOOL)animated {
}
-(void)viewWillDisappear:(BOOL)animated {
}
-(void)viewDidDisappear:(BOOL)animated {
}

#pragma mark - Initialize UI view

-(void)initializeUI {
    
    [_btnAddPost setSelected:YES];
    [self initializingTitles];
}

-(void)initializingTitles
{
    [self loadImage];
}

-(void)ImageChange:(NSNotification *)notify
{
    
    [self loadImage];
}

-(void)loadImage
{
    _imageVIewProfile.layer.cornerRadius = _imageVIewProfile.frame.size.height/2;
    
    
    
}

#pragma mark - button actions



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

-(void)setViewController:(NSString * )VC
{
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:VC]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}

- (IBAction)actionBtnFriendList:(id)sender {
    
    [self setViewController:SegueFreindsListVc];

}

- (IBAction)actionBtnFollowList:(id)sender {
    [self setViewController:SegueFollowVc];

}

- (IBAction)actionBtnEditSubscription:(id)sender {
    
    [self setViewController:SegueCategoryVc];
}

- (IBAction)actionBtnFeed:(id)sender {
    
    [self setViewController:SegueFeed];
}

- (IBAction)actionBtnProfile:(id)sender {
    
    [self setViewController:SegueProfileVc];
    
}

- (IBAction)actionBtnAddPost:(id)sender {
    [self setViewController:SegueAddPostVc];

}

- (IBAction)actionBtnEyeWitness:(id)sender {
    [self setViewController:SegueEyeWitnessVc];

}

- (IBAction)actionBtnJournalist:(id)sender {
    [self setViewController:SegueJornalistVc];

}

- (IBAction)actionbtnNotifiaction:(id)sender {
    [self setViewController:SegueNotificationVc];

}

- (IBAction)actionBtnSettings:(id)sender {
    [self setViewController:SegueSettingVc];

}
@end