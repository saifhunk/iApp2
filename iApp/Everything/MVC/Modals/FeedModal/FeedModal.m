//
//  FeedModal.m
//  iApp
//
//  Created by Saif Chaudhary on 11/1/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "FeedModal.h"

@implementation FeedModal



-(id )initWithAttributes:(NSDictionary *)attributes
{
    
    
    self.FeedModal_title = [attributes valueForKey:@"title"];
    self.FeedModal_link = [attributes valueForKey:@"link"];
    self.FeedModal_description = [attributes valueForKey:@"description"];
    self.FeedModal_pubDate = [attributes valueForKey:@"pubDate"];
   
    
    return self;
    
}



+(NSMutableArray *)ParseArrayToDict:(NSArray *)array
{
    NSMutableArray * arrayData = [[NSMutableArray alloc]init];
    
    for (NSDictionary * dict in array) {
        
        FeedModal * cm = [[FeedModal alloc] initWithAttributes:dict];
        [arrayData addObject:cm];
        
    }
    
    return arrayData;
}


@end
