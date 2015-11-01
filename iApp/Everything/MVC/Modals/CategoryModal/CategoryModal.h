//
//  CategoryModal.h
//  iApp
//
//  Created by Saif Chaudhary on 10/31/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModal : NSObject

@property(nonatomic,strong)NSString * CategoryModal_CategoryID;
@property(nonatomic,strong)NSString * CategoryModal_CategoryName;
@property(nonatomic,strong)NSString * CategoryModal_CreatedDate;
@property(nonatomic,strong)NSString * CategoryModal_IsActive;
@property(nonatomic,strong)NSMutableArray * CategoryModal_Feedlink;




@property(nonatomic,strong)NSString * CategoryModal_FeedLinkID;
@property(nonatomic,strong)NSString * CategoryModal_ID;
@property(nonatomic,strong)NSString * CategoryModal_FeedLinkName;
@property(nonatomic,strong)NSString * CategoryModal_FeedLinkURL;
@property(nonatomic,strong)NSString * CategoryModal_FeedActive;


+(NSMutableArray *)ParseArrayToDict:(NSArray *)array;

@end
