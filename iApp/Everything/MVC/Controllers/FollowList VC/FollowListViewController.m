//
//  FollowListViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 10/9/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "FollowListViewController.h"

@interface FollowListViewController ()

@end

@implementation FollowListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FollowListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FollowCell" forIndexPath:indexPath];
    return cell;
}

- (IBAction)actionBtnSidePanel:(id)sender
{

[[NSNotificationCenter defaultCenter] postNotificationName:@"iApp_sidePanelOpen" object:nil];

}
@end
