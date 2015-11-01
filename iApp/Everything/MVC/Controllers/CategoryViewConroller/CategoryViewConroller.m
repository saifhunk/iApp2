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

@end

@implementation CategoryViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUi];
    [self CallingApi];
    
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
    
    if (_IsFromLogin == YES) {
        _btnSidepanel.hidden = YES;
    }
    [_btnFeeed setEnabled:NO];
    [_btnFeeed setAlpha:0.5];
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"KuserCategory"];
    _arrayFavourite = [[NSMutableArray alloc]init];
//    _arrayCategories = [[NSMutableArray alloc]initWithObjects:@"Tech",@"Science",@"Food",@"Movies",@"Comedy",@"Music",@"Politics", nil];
//    
    [_CollectionViewCategory registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCategory"];
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
            [_CollectionViewCategory reloadData];
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
    if (_collectionViewFavorite == collectionView)
    {
        
        return _arrayFavourite.count;
    }
    else{
        return _arrayCategories.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (_collectionViewFavorite == collectionView) {
        
    CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCategory" forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
        CategoryModal * obj = [_arrayFavourite objectAtIndex:indexPath.row];
        
        cell.labelCategoryName.text = obj.CategoryModal_CategoryName;
        cell.labelCategoryName.textColor = AppGrayColor;
    
    return cell;
    }
    else
    {
        CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCategory" forIndexPath:indexPath];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil]objectAtIndex:0];
        }
        CategoryModal * obj = [_arrayCategories objectAtIndex:indexPath.row];

        cell.labelCategoryName.text = obj.CategoryModal_CategoryName;
        cell.labelCategoryName.textColor = AppGrayColor;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_CollectionViewCategory == collectionView) {
        [_btnFeeed setAlpha:1];
        [_btnFeeed setEnabled:YES];
       
        if (_arrayFavourite.count == 0) {
            
            [_arrayFavourite addObject:[_arrayCategories objectAtIndex:indexPath.row]];

        }
        else
        {
            BOOL Istrue = false;
            
            
            CategoryModal * modal2 = [_arrayCategories objectAtIndex:indexPath.row];
            for (CategoryModal * modal in _arrayFavourite) {
            
            if (modal.CategoryModal_CategoryID.integerValue == modal2.CategoryModal_CategoryID.integerValue) {
                Istrue = true;
            }
            }
            if (Istrue  == false) {
                [_arrayFavourite addObject:modal2];

            }
            
        }
            [_collectionViewFavorite reloadData];
        
    }
    else
    {
        [self performSegueWithIdentifier:@"RemoveCategory" sender:indexPath];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (_CollectionViewCategory == collectionView) {

    return 0;
    }
    else
    {
        return 0;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (_CollectionViewCategory == collectionView) {
        
        return 0;
    }
    else
    {
        return 0;
    }

}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
        return UIEdgeInsetsMake(0, 10, 0, 0);

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RemoveCategoryViewController * vc = segue.destinationViewController;
    NSIndexPath * indexpath = sender;
    vc.Deleagte =self;
    [vc getData:[_arrayFavourite objectAtIndex:indexpath.row] :indexpath];
}

-(void)DeleteClicked:(NSIndexPath *)indexpath
{
    [_arrayFavourite removeObjectAtIndex:indexpath.row];
    [_collectionViewFavorite reloadData];
}

#pragma mark - IBAction

- (IBAction)ActionBtnFeed:(id)sender {
    
    if (_arrayFavourite.count == 0) {
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults rm_setCustomObject:_arrayCategories forKey:@"KuserCategory"];
    }
    else
    {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults rm_setCustomObject:_arrayFavourite forKey:@"KuserCategory"];
    }
    RootSidePanelViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:@"RootSidePanelViewController"];
    [self.navigationController pushViewController:VC animated:YES];
  

}

- (IBAction)actionBtnSidepanel:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"iApp_sidePanelOpen" object:nil];

}
@end
