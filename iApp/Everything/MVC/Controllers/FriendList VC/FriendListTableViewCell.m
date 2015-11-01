//
//  FriendListTableViewCell.m
//  iApp
//
//  Created by Saif Chaudhary on 10/9/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "FriendListTableViewCell.h"

@implementation FriendListTableViewCell

- (void)awakeFromNib {
 
    // Initialization code
   _imageViewProfile.layer.cornerRadius =  _imageViewProfile.frame.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
