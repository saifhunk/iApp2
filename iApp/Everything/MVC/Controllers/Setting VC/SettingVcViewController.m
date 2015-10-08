//
//  SettingVcViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 9/4/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "SettingVcViewController.h"

@interface SettingVcViewController ()

@end

@implementation SettingVcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupNavigationBar];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupNavigationBar
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.translucent = YES;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = AppBlueColor;
}

- (IBAction)actionbtnSidePanel:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"iApp_sidePanelOpen" object:nil];

}

- (IBAction)actionBtnLogout:(id)sender {
    
    [[[UIAlertView alloc]initWithTitle:@"" message:@"Coming soon" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil]show];
}
@end
