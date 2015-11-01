//
//  FollowListTableViewCell.h
//  iApp
//
//  Created by Saif Chaudhary on 10/9/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@end
