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
    _labelHeading.textColor = [UIColor blackColor];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.tintColor = AppGrayColor;
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Remove" style:UIBarButtonItemStylePlain target:self action:@selector(BtnRemoveClicked:)];
    [anotherButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:@"Helvetica" size:18.0], NSFontAttributeName,
                                           AppGrayColor, NSForegroundColorAttributeName,
                                           nil]
                                 forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = anotherButton;
    self.navigationItem.title = _strHeader;
    
}


-(void)getData:(CategoryModal *)Category :(NSIndexPath *)indexpath;
{
    _strHeader = [[NSString alloc]init];
    _indexpath = [[NSIndexPath alloc]init];
    _arraylinks = [[NSArray alloc]init];
    _strHeader = Category.CategoryModal_CategoryName;
    _indexpath = indexpath;
    _arraylinks = Category.CategoryModal_Feedlink.mutableCopy;
    [_tableViewWebsites reloadData];
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


#pragma mark - TableView delegates and datasources

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 8, 0, 8)];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * indexpath = sender;
    CategoryModal * obj = [_arraylinks objectAtIndex:indexpath.row];

    [segue.destinationViewController GetUrl:obj.CategoryModal_FeedLinkURL];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [self performSegueWithIdentifier:@"SegueWebsite" sender:indexPath];
}

#pragma mark - tableView Deleagtes

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return _arraylinks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellRemove"];
    [cell setSelectionStyle:NO];
    CategoryModal * obj = [_arraylinks objectAtIndex:indexPath.row];
    cell.textLabel.text =obj.CategoryModal_FeedLinkName;
    return cell;
}

@end
