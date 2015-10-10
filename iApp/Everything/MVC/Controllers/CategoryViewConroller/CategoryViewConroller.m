//
//  CategoryViewConroller.m
//  iApp
//
//  Created by Saif Chaudhary on 9/6/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "CategoryViewConroller.h"
#import "RootSidePanelViewController.h"
#define Width6 375

@interface CategoryViewConroller ()

@end

@implementation CategoryViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUi];
    
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
 
    [_btnFeeed setEnabled:NO];
    [_btnFeeed setAlpha:0.5];

    _arrayFavourite = [[NSMutableArray alloc]init];
    _arrayCategories = [[NSMutableArray alloc]initWithObjects:@"Tech",@"Science",@"Food",@"Movies",@"Comedy",@"Music",@"Politics", nil];
    
    [_CollectionViewCategory registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCategory"];
    [_collectionViewFavorite registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCategory"];
}

#pragma mark - collectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_collectionViewFavorite == collectionView)
    {
        
        return _arrayFavourite.count;
    }
    else{
    return 7;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (_CollectionViewCategory == collectionView) {
        
    CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCategory" forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
        cell.labelCategoryName.text = [_arrayCategories objectAtIndex:indexPath.row];
        cell.labelCategoryName.textColor = AppGrayColor;
    
    return cell;
    }
    else
    {
        CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCategory" forIndexPath:indexPath];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil]objectAtIndex:0];
        }
        cell.labelCategoryName.font = [UIFont fontWithName:@"Halvetica" size:16.0f];
        cell.labelCategoryName.text = [_arrayFavourite objectAtIndex:indexPath.row];
        cell.labelCategoryName.textColor = AppGrayColor;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_CollectionViewCategory == collectionView) {
        [_btnFeeed setAlpha:1];
        [_btnFeeed setEnabled:YES];
        if (![_arrayFavourite containsObject:[_arrayCategories objectAtIndex:indexPath.row]]) {
            [_arrayFavourite addObject:[_arrayCategories objectAtIndex:indexPath.row]];
            [_collectionViewFavorite reloadData];
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"RemoveCategory" sender:indexPath];
//        [_arrayFavourite removeObjectAtIndex:indexPath.row];
//        [_collectionViewFavorite reloadData];
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
    CGRect screen = [[UIScreen mainScreen]bounds];
    if (Width6 != screen.size.width) {
        return UIEdgeInsetsMake(0, 10, 0, 0);

    }
    else
    {
        return UIEdgeInsetsMake(0, 10, 0, 0);
    }
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
    
    RootSidePanelViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:@"RootSidePanelViewController"];
    [self.navigationController pushViewController:VC animated:YES];

}
@end
