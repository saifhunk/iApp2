//
//  LoginViewViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 03/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Saif Chaudhary. All rights reserved.
//

#import "LoginViewViewController.h"
#import "Header.h"

@interface LoginViewViewController ()

@end

@implementation LoginViewViewController

#pragma mark - ViewHeirarchy

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _tfEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    _tfPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    _ViewTfLogin.layer.borderColor = [UIColor colorWithRed:217/255.0f green:214/255.0f blue:214/255.0f alpha:1].CGColor;
    _ViewTfLogin.layer.borderWidth =1.0f;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextField Delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_tfEmail resignFirstResponder];
}

#pragma mark - IBAction

- (IBAction)actionBtnFacebook:(id)sender {
    
    [[[UIAlertView alloc]initWithTitle:@"" message:@"Coming soon" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil]show];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CategoryViewConroller"]) {
        
        CategoryViewConroller * VC = segue.destinationViewController;
        VC.IsFromLogin = YES;
        
    }
}

- (IBAction)actionBtnLogin:(id)sender {
}

- (IBAction)actionBtnRegister:(id)sender {
}
@end
