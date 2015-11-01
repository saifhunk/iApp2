//
//  CategoryModal.m
//  iApp
//
//  Created by Saif Chaudhary on 10/31/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "CategoryModal.h"

@implementation CategoryModal

-(id )initWithAttributes:(NSDictionary *)attributes
{
    
    int a = [[attributes valueForKey:@"CategoryID"] intValue];

    self.CategoryModal_CategoryID = [NSString stringWithFormat:@"%i",a];
    self.CategoryModal_CategoryName = [attributes valueForKey:@"CategoryName"];
    self.CategoryModal_CreatedDate = [attributes valueForKey:@"CreatedDate"];
    self.CategoryModal_IsActive = [attributes valueForKey:@"IsActive"];
    self.CategoryModal_Feedlink = [[NSMutableArray alloc]init];
    for (NSDictionary * dict1 in [attributes valueForKey:@"FeedLink"]) {
        
        CategoryModal * cm = [[CategoryModal alloc] initWithAttributes1:dict1];
        [self.CategoryModal_Feedlink addObject:cm];
    }
    
    return self;
    
}

-(id )initWithAttributes1:(NSDictionary *)attributes
{
    
    self.CategoryModal_FeedLinkID = [attributes valueForKey:@"FeedLinkID"];
    self.CategoryModal_ID = [attributes valueForKey:@"CategoryID"];
    self.CategoryModal_FeedLinkName = [attributes valueForKey:@"FeedLinkName"];
    self.CategoryModal_FeedLinkURL = [attributes valueForKey:@"FeedLinkURL"];
    self.CategoryModal_FeedActive = [attributes valueForKey:@"IsActive"];
    return self;
    
}


+(NSMutableArray *)ParseArrayToDict:(NSArray *)array
{
    NSMutableArray * arrayData = [[NSMutableArray alloc]init];

    for (NSDictionary * dict in array) {
        
        CategoryModal * cm = [[CategoryModal alloc] initWithAttributes:dict];
        [arrayData addObject:cm];

        }
    
    return arrayData;
}


@end
