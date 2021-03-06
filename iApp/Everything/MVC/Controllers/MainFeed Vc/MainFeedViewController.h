//
//  MainFeedViewController.h
//  iApp
//
//  Created by Saif Chaudhary on 04/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "MainFeedCollectionViewCellTop.h"
#import "PostViewController.h"
#import "BLLoader.h"


@interface MainFeedViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,JournlistClicked>

#pragma mark - Custom property

@property(nonatomic,strong)NSArray * arrayDataTop;
@property(nonatomic,strong)NSArray * arrayDataBottom;


#pragma mark - IBOutlet

@property (weak, nonatomic) IBOutlet UIButton *btnFilter;
@property (weak, nonatomic) IBOutlet UIButton *btnGroup;
@property (weak, nonatomic) IBOutlet UIButton *btnFeed;

@property (weak, nonatomic) IBOutlet UIButton *btnProfile;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewTop;
@property (weak, nonatomic) IBOutlet BLLoader *Loader;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewBottom;

//Height Constarints
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeightTopCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeightBottomCollectionView;

#pragma mark - IBAction

- (IBAction)actionBtnGroup:(id)sender;
- (IBAction)actionBtnProfile:(id)sender;
- (IBAction)actionBnFilter:(id)sender;
- (IBAction)actionFeed:(id)sender;


@end
