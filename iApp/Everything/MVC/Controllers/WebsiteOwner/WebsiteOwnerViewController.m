//
//  WebsiteOwnerViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 9/28/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "WebsiteOwnerViewController.h"

@interface WebsiteOwnerViewController ()

@end

@implementation WebsiteOwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
