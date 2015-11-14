//
//  RegisterViewController.h
//  FoundNemo
//
//  Created by Binit Vermani on 27/06/15.
//  Copyright (c) 2015 Binit Vermani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"


@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property BOOL boolInternetCheck;
@property(nonatomic,strong)NSMutableArray * arrCountries;

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIView *viewUsername;
@property (weak, nonatomic) IBOutlet UIView *viewGender;
@property (weak, nonatomic) IBOutlet UIView *viewCity;
@property (weak, nonatomic) IBOutlet UIView *viewState;
@property (weak, nonatomic) IBOutlet UIView *viewCountry;
@property (weak, nonatomic) IBOutlet UIView *viewPassword;
@property (weak, nonatomic) IBOutlet UIView *viewConfirmPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnCountry;

@property (weak, nonatomic) IBOutlet UIButton *btnGender;





#pragma mark - button actions
- (IBAction)ActionBtnCounty:(id)sender;
- (IBAction)actionBtnGender:(id)sender;
- (IBAction)actionBtnArrowGender:(id)sender;
- (IBAction)actionBtnArrowCountry:(id)sender;

- (IBAction)actionBtnCancel:(id)sender;
- (IBAction)actionBtnNext:(id)sender;

@end