//
//  FeedModal.h
//  iApp
//
//  Created by Saif Chaudhary on 11/1/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedModal : NSObject

@property(nonatomic,strong)NSString * FeedModal_title;
@property(nonatomic,strong)NSString * FeedModal_link;
@property(nonatomic,strong)NSString * FeedModal_description;
@property(nonatomic,strong)NSString * FeedModal_pubDate;



+(NSMutableArray *)ParseArrayToDict:(NSArray *)array;


@end
