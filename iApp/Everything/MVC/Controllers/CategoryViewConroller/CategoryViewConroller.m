//
//  CategoryViewConroller.m
//  iApp
//
//  Created by Saif Chaudhary on 9/6/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "CategoryViewConroller.h"
#import "RootSidePanelViewController.h"
#import "Header.h"

@interface CategoryViewConroller ()
{
    NSMutableArray * arrayIndex;
}

@end

@implementation CategoryViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUi];
   // [self CallingApi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

}

-(void)setupUi
{
    
    _tabelViewWebsites.allowsMultipleSelection = NO;
    if (_IsFromLogin == YES) {
        _btnSidepanel.hidden = YES;
    }
    [_btnFeeed setEnabled:YES];
    [_btnFeeed setAlpha:1];
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"KuserCategory"];
    _arrayFavourite = [[NSMutableArray alloc]init];
    arrayIndex = [[NSMutableArray alloc]init];
    //_arraylinks = [[NSMutableArray alloc]init];

    
    self.arrayCategories = [[NSMutableArray alloc]initWithObjects:@"Tech",@"Science",@"Food",@"Movies",@"Music",@"Politics", nil];
    self.arrayFavourite = [[NSMutableArray alloc]initWithObjects:@"51.jpg",@"52.jpg",@"53.jpg",@"54.jpg",@"55.jpg",@"56.jpg", nil];
//    //
    [_collectionViewFavorite registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCategory"];
}



-(void)CallingApi
{
    
    _Loader.lineWidth = 50.0;
    _Loader.color = [UIColor grayColor];
    [_Loader startAnimation];
    
    [iOSRequest getJSONRespone:[NSString stringWithFormat:kGetCategory,KBaseUrl] :^(NSDictionary *response_success) {
        
        [_Loader stopAnimation];
        [_Loader removeFromSuperview];
        
        if ([[response_success valueForKey:@"Status"] integerValue]==1) {
            
        _arrayCategories = [[NSMutableArray alloc]init];
        _arrayFavourite = [[NSMutableArray alloc]init];

        _arrayCategories = [CategoryModal ParseArrayToDict:[response_success valueForKey:@"data"]];
        }
        else
        {
            [self alertShow:@"Error" :[response_success valueForKey:@"Message"]];

        }
        
        
    } :^(NSError *response_error) {
        [_Loader stopAnimation];
        [_Loader removeFromSuperview];
        [self alertShow:@"Error" :response_error.localizedDescription];
    }];
}

-(void)alertShow:(NSString *)title : (NSString *)msg
{
    [[[UIAlertView alloc]initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:@"nil", nil]show];
}

#pragma mark - collectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  
        
        return _arrayCategories.count;
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{

    
    CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCategory" forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
        //CategoryModal * obj = [_arrayFavourite objectAtIndex:indexPath.row];
        
    cell.labelCategoryName.text = [_arrayCategories objectAtIndex:indexPath.row];
        //cell.labelCategoryName.textColor = AppGrayColor;
    cell.imageViewBackgroundImage.image = [UIImage imageNamed:[_arrayFavourite objectAtIndex:indexPath.row]];
    
    return cell;

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(_collectionViewFavorite.frame.size.width, _collectionViewFavorite.frame.size.height);
}
#pragma mark - TableView Delegate


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
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
    
    [segue.destinationViewController GetUrl:@"www.google.com"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [self performSegueWithIdentifier:@"SegueWebsite" sender:indexPath];
}

#pragma mark - tableView Deleagtes

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
        
        WebsiteTableViewCell * cell = (WebsiteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"WebsiteCell"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WebsiteCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    

    cell.selectionStyle = NO;
    cell.labelWebsiteName.text =@"www.zomato.com";
    cell.btnSelectWebsite.tag = indexPath.row;
    [cell.btnSelectWebsite addTarget:self action:@selector(BtnSelctedClicked:) forControlEvents:UIControlEventTouchUpInside];
    BOOL IsSelected = false;

    for (NSIndexPath * index in arrayIndex) {
        
        if (index.row == indexPath.row) {
            
            IsSelected = true;
        }
    }
  
    
    if (IsSelected == false) {
        
        
        cell.btnSelectWebsite.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.btnSelectWebsite.layer.borderWidth = 1.0f;
        cell.btnSelectWebsite.clipsToBounds = YES;
        cell.btnSelectWebsite.layer.cornerRadius = 4.0f;
    }
    else
    {
        cell.btnSelectWebsite.layer.borderColor = [UIColor colorWithRed:26/255.0 green:168/255.0 blue:238/255.0 alpha:1].CGColor;
        cell.btnSelectWebsite.layer.borderWidth = 1.0f;
        cell.btnSelectWebsite.clipsToBounds = YES;
        cell.btnSelectWebsite.layer.cornerRadius = 4.0f;
    }    return cell;
}


-(void)BtnSelctedClicked:(UIButton *)btn
{
    if (arrayIndex.count!=0) {

        BOOL IsSelected = false;
        
        NSMutableArray * arrayWebsites = arrayIndex.mutableCopy;
        for (NSIndexPath * index in arrayIndex) {
            
            if (index.row == btn.tag) {
                
                IsSelected = true;
                [arrayWebsites removeObject:index];
            }
        }
         WebsiteTableViewCell * cell =  ( WebsiteTableViewCell *)[_tabelViewWebsites cellForRowAtIndexPath:[NSIndexPath indexPathForItem:btn.tag inSection:0]];
        
        if (IsSelected == true) {
           
            
            cell.btnSelectWebsite.layer.borderColor = [UIColor lightGrayColor].CGColor;
            cell.btnSelectWebsite.layer.borderWidth = 1.0f;
            cell.btnSelectWebsite.clipsToBounds = YES;
            cell.btnSelectWebsite.layer.cornerRadius = 4.0f;
        }
        else
        {
            cell.btnSelectWebsite.layer.borderColor = [UIColor colorWithRed:26/255.0 green:168/255.0 blue:238/255.0 alpha:1].CGColor;
            cell.btnSelectWebsite.layer.borderWidth = 1.0f;
            cell.btnSelectWebsite.clipsToBounds = YES;
            cell.btnSelectWebsite.layer.cornerRadius = 4.0f;
            [arrayWebsites addObject:[NSIndexPath indexPathForItem:btn.tag inSection:0]];
        }
        arrayIndex = [[NSMutableArray alloc]init];
        arrayIndex = arrayWebsites.mutableCopy;
    
    }
    else
    {
        WebsiteTableViewCell * cell =  ( WebsiteTableViewCell *)[_tabelViewWebsites cellForRowAtIndexPath:[NSIndexPath indexPathForItem:btn.tag inSection:0]];
        cell.btnSelectWebsite.layer.borderColor = [UIColor colorWithRed:26/255.0 green:168/255.0 blue:238/255.0 alpha:1].CGColor;
        cell.btnSelectWebsite.layer.borderWidth = 1.0f;
        cell.btnSelectWebsite.clipsToBounds = YES;
        cell.btnSelectWebsite.layer.cornerRadius = 4.0f;
        [arrayIndex addObject:[NSIndexPath indexPathForItem:btn.tag inSection:0]];
    }

    
}

-(void)DeleteClicked:(NSIndexPath *)indexpath
{
    [_arrayFavourite removeObjectAtIndex:indexpath.row];
    [_collectionViewFavorite reloadData];
}


#pragma mark - IBAction

- (IBAction)actionBtnRigth:(id)sender {
    
    NSIndexPath * indexPath = [_collectionViewFavorite indexPathForCell:[[_collectionViewFavorite visibleCells] lastObject]];
    
    if (indexPath.row == [_arrayCategories count] - 1) {
        
    }
    else{
        
        [_collectionViewFavorite scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        
    }

}

- (IBAction)actionBtnLeft:(id)sender {
    
    NSIndexPath * indexPath = [_collectionViewFavorite indexPathForCell:[[_collectionViewFavorite visibleCells] lastObject]];
    
    [_collectionViewFavorite scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    if (indexPath.row != 0) {
        
        [_collectionViewFavorite scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
}

- (IBAction)ActionBtnFeed:(id)sender {
    
    if (arrayIndex.count == 0) {
        
//        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//        [defaults rm_setCustomObject:_arrayCategories forKey:@"KuserCategory"];
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Please Select Website" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil]show];
    }
    else
    {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults rm_setCustomObject:_arrayFavourite forKey:@"KuserCategory"];
        RootSidePanelViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:@"RootSidePanelViewController"];
        [self.navigationController pushViewController:VC animated:YES];
    }
   
  

}

- (IBAction)actionBtnSidepanel:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"iApp_sidePanelOpen" object:nil];

}
@end
