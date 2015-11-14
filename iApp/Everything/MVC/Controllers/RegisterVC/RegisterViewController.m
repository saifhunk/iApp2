//
//  RegisterViewController.m
//  FoundNemo
//
//  Created by Binit Vermani on 27/06/15.
//  Copyright (c) 2015 Binit Vermani. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate,UIActionSheetDelegate>

@end

#pragma mark - View Hierarchy

@implementation RegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializingUI];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [UIApplication sharedApplication].statusBarHidden = NO;

}

-(void)dealloc {
    
   
}

-(void)viewDidAppear:(BOOL)animated {
}

-(void)viewWillDisappear:(BOOL)animated {
}

-(void)viewDidDisappear:(BOOL)animated {
}

-(void)citySelected : (NSNotification *)noti {
    
    //[_btnCurrentCity setTitle:[noti.userInfo valueForKey:@"city"] forState:UIControlStateNormal];
}

#pragma mark - Initialize UI

-(void)initializingUI {
    
//    [self initializingTitles];
//    [_viewMale setHidden:NO];
//    [_viewFemale setHidden:YES];
//    [_btnMale setSelected:YES];
//    _viewUserDetial.layer.cornerRadius = 5;
//    _viewPassword.layer.cornerRadius = 5;
//    _btnCancel.layer.cornerRadius = 5;
//    _btnNext.layer.cornerRadius = 5;
    
    [self settingUpBorder:_viewCity];
    [self settingUpBorder:_viewConfirmPassword];
    [self settingUpBorder:_viewCountry];
    [self settingUpBorder:_viewGender];
    [self settingUpBorder:_viewPassword];
    [self settingUpBorder:_viewState];
    [self settingUpBorder:_viewUsername];
    
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    _arrCountries = [[NSMutableArray alloc] init];
    
    for (NSString *countryCode in countryArray) {
        
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        [_arrCountries addObject:displayNameString];
    }



    
}

-(void)settingUpBorder :(UIView *)viewBorder
{
    viewBorder.layer.borderColor = [UIColor colorWithRed:217/255.0f green:214/255.0f blue:214/255.0f alpha:1].CGColor;
    viewBorder.layer.borderWidth =1.0f;
}

-(void)initializingTitles {
    
//    _tfName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfCity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"City" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfState.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"State/Provinces" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfCountry.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Country" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    _tfReEnterPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Re-enter Password" attributes:@{NSForegroundColorAttributeName: AppGrayColor}];
//    [_btnMale setTitle:@"Male" forState:UIControlStateNormal];
//    [_btnFemale setTitle:@"Female" forState:UIControlStateNormal];
//    [_btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
//    [_btnNext setTitle:@"Next" forState:UIControlStateNormal];
//    [_btnCurrentCity setTitle:@"Current Location" forState:UIControlStateNormal];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    
//    [textField resignFirstResponder];
//    return YES;
//}

#pragma mark - AlertView

-(void)alertView : (NSString *)message {
    
    [[[UIAlertView alloc] initWithTitle:@"Fields not filled :" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (actionSheet.tag == 10) {
        
        if (buttonIndex == 0) {
            
            [_btnGender setTitle:@"Male" forState:UIControlStateNormal];//male
        }
        else if (buttonIndex == 1)
        {
            [_btnGender setTitle:@"Female" forState:UIControlStateNormal];
  //female
        }
    }
    
    else
    {
        if (buttonIndex == actionSheet.cancelButtonIndex)
        {
            // Handle cancel action
        }
        else
        {
          NSString * name=   [_arrCountries objectAtIndex:buttonIndex-1];
            [_btnCountry setTitle:name forState:UIControlStateNormal];

        }
    }
    
}

#pragma mark - button actions

- (IBAction)actionBtnMale:(id)sender {
    
//    [_btnMale setSelected:YES];
//    [_btnFemale setSelected:NO];
//    [_viewMale setHidden:NO];
//    [_viewFemale setHidden:YES];
}

- (IBAction)actionBtnCurrentCity:(id)sender {
    
   }

- (IBAction)actionBtnFemale:(id)sender {
    
//    [_btnFemale setSelected:YES];
//    [_btnMale setSelected:NO];
//    [_viewMale setHidden:YES];
//    [_viewFemale setHidden:NO];
}

-(void)selectCountry
{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"Select Country" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    for (NSString * names in _arrCountries) {
        
        [sheet addButtonWithTitle:names];
    }
    [sheet showInView:self.view];
}

- (IBAction)ActionBtnCounty:(id)sender {
    
    [self selectCountry];
}

-(void)selectGender
{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"Select Gender" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Male",@"Female", nil];
    sheet.tag =10;
    [sheet showInView:self.view];
}


- (IBAction)actionBtnGender:(id)sender {
    
    [self selectGender];
}

- (IBAction)actionBtnArrowGender:(id)sender {
    [self selectGender];

}

- (IBAction)actionBtnArrowCountry:(id)sender {
    
    [self selectCountry];

}

- (IBAction)actionBtnCancel:(id)sender {
    
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionBtnNext:(id)sender {
    
    [self.view endEditing:YES];
    
//    if(0 == [_tfName.text length]) {
//        
//        [self alertView:@"Please enter a valid Username"];
//        return;
//    }
    
}

#pragma mark - TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
//    if(_tfPassword == textField || _tfReEnterPassword == textField) {
//     
//        [UIView animateWithDuration:0.25 animations:^{
//            
//            self.view.transform = CGAffineTransformMakeTranslation(0, -200);
//        }];
//    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

//    [UIView animateWithDuration:0.25 animations:^{
//        
//        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
//    }];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
//    if([_tfName isFirstResponder]) {
//        
//        [_tfEmail becomeFirstResponder];
//    }
//    else if ([_tfEmail isFirstResponder]) {
//        
//        [self.view endEditing:YES];
//    }
//    else if ([_tfPassword isFirstResponder]) {
//        
//        [_tfReEnterPassword becomeFirstResponder];
//    }
//    else {
//        
//        [self.view endEditing:YES];
//    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end