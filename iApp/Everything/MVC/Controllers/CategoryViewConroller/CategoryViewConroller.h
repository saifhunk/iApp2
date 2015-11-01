//
//  CategoryViewConroller.h
//  iApp
//
//  Created by Saif Chaudhary on 9/6/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RemoveCategoryViewController.h"
#import "BLLoader.h"
#import "CategoryModal.h"

@interface CategoryViewConroller : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,DelegateRemoveCategory>

#pragma mark - Custom Property

@property BOOL IsFromLogin;
@property(nonatomic,strong)NSMutableArray * arrayFavourite;
@property(nonatomic,strong)NSMutableArray * arrayCategories;
@property (weak, nonatomic) IBOutlet BLLoader *Loader;


#pragma mark - IBOutlet

@property (weak, nonatomic) IBOutlet UIButton *btnSidepanel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewFavorite;
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionViewCategory;
@property (weak, nonatomic) IBOutlet UIButton *btnFeeed;

#pragma mark - IBAction

- (IBAction)ActionBtnFeed:(id)sender;
- (IBAction)actionBtnSidepanel:(id)sender;

@end
