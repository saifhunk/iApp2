//
//  RemoveCategoryViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 9/20/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "RemoveCategoryViewController.h"

@interface RemoveCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation RemoveCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewWebsites.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    [self setupNavigationBar];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupNavigationBar
{
    _labelHeading.text = _strHeader;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = AppGreenColor;
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Remove" style:UIBarButtonItemStylePlain target:self action:@selector(BtnRemoveClicked:)];
    [anotherButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:@"Helvetica" size:18.0], NSFontAttributeName,
                                           AppGreenColor, NSForegroundColorAttributeName,
                                           nil]
                                 forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = anotherButton;
    
}


-(void)getData:(NSString *)strCategory :(NSIndexPath *)indexpath
{
    _strHeader = [[NSString alloc]init];
    _indexpath = [[NSIndexPath alloc]init];
    _strHeader = strCategory;
    _indexpath = indexpath;
}

-(void)BtnRemoveClicked:(UIButton *)btn
{
    
    [[[UIAlertView alloc] initWithTitle:nil
                               message:@"Are you sure want to remove"
                              delegate:self
                     cancelButtonTitle:@"Yes"
                     otherButtonTitles:@"Cancel", nil] show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        
        [self.Deleagte DeleteClicked:_indexpath];
        [self.navigationController popViewControllerAnimated:YES];
}
    
}


#pragma mark - tableView Deleagtes

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellRemove"];
    cell.textLabel.text =@"www.amazone.com";
    return cell;
}

@end
