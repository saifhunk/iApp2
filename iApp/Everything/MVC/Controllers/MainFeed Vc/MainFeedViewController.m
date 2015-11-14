//
//  MainFeedViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 04/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Saif Chaudhary. All rights reserved.

#import "MainFeedViewController.h"
#import "CategoryViewConroller.h"

@interface MainFeedViewController ()


@property bool IsapiHit;


@end

#define Height4s 480

@implementation MainFeedViewController


#pragma mark - ViewHeirarchy

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupUI];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];


}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CategoryIds" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)SetupUI
{
//    
//    _Loader.lineWidth = 50.0;
//    _Loader.color = [UIColor grayColor];
//    [_Loader startAnimation];
    
    [_Loader setHidden:YES];
   
   // NSString * strId;
        _arrayDataTop = [[NSArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg", nil];
    _arrayDataBottom = [[NSArray alloc]initWithObjects:@"5.jpg",@"3.jpg",@"4.jpg",@"1.jpg",@"2.jpg", nil];
    [_collectionViewBottom reloadData];
    [_collectionViewTop reloadData];
    //NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
//    if ([defaults rm_customObjectForKey:@"KuserCategory"]!=nil)
//    {
//      NSArray *  CategoryArr = [defaults rm_customObjectForKey:@"KuserCategory"];
//        
//        CategoryModal * modal = [CategoryArr firstObject];
//        if (modal.CategoryModal_CategoryID.integerValue == 4 || modal.CategoryModal_CategoryID.integerValue == 7) {
//          
//            strId = @"1";
//
//        }
//        else
//        {
//            strId = modal.CategoryModal_CategoryID;
//
//        }
//        
//        
//        for (int i = 1; i < CategoryArr.count; i++)
//        {
//            
//            CategoryModal * modal = [CategoryArr objectAtIndex:i];
//            if (modal.CategoryModal_CategoryID.integerValue == 4 || modal.CategoryModal_CategoryID.integerValue == 7) {
//                
//                strId = [strId stringByAppendingString:[NSString stringWithFormat:@",%@",@"1"]];
//
//            }
//            else
//            {
//            strId = [strId stringByAppendingString:[NSString stringWithFormat:@",%@",modal.CategoryModal_CategoryID]];
//            }
//
////        }
//        [self.view setUserInteractionEnabled:NO];
//    
//    strId = @"1,2,3,5.6,8,9";
//        [iOSRequest getJSONRespone:[NSString stringWithFormat:kGetFeedById,KBaseUrl,strId] :^(NSDictionary *response_success) {
//            
//            [self.view setUserInteractionEnabled:YES];
//
//            [_Loader stopAnimation];
//            [_Loader removeFromSuperview];
//            if ([[response_success valueForKey:@"Status"] integerValue]==1) {
//                _IsapiHit = YES;
//                _arrayDataBottom = [[NSMutableArray alloc]init];
//                _arrayDataBottom = [FeedModal ParseArrayToDict:[response_success valueForKey:@"data"]];
//
//                
//                 [_collectionViewBottom reloadData];
//            }
//            else
//            {
//                [self alertShow:@"Error" :[response_success valueForKey:@"Message"]];
//                
//            }
//
//            
//        } :^(NSError *response_error) {
//            
//            [self.view setUserInteractionEnabled:YES];
//
//            [_Loader stopAnimation];
//            [_Loader removeFromSuperview];
//            [self alertShow:@"Error" :response_error.localizedDescription];
//        }];
//        
//    

}

-(void)alertShow:(NSString *)title : (NSString *)msg
{
    [[[UIAlertView alloc]initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:@"nil", nil]show];
}




#pragma mark - ViewHeirarchy


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_collectionViewTop == collectionView) {
        
        return _arrayDataTop.count;
    }
    else
    {
        return _arrayDataBottom.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_collectionViewTop == collectionView) {
        
        
        MainFeedCollectionViewCellTop * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellTop forIndexPath:indexPath];
        CGRect height = [[UIScreen mainScreen]bounds];
        
        if (Height4s == height.size.height) {
            
            cell.constraintBtnEye.constant = 10;
        }
        cell.ImageVIewBack.image = [UIImage imageNamed:[_arrayDataTop objectAtIndex:indexPath.row]];
        cell.labelName.text=@"Superman";
        cell.labelDetails.text= @"Coming Soon";
        cell.labelWebsite.text = @"wwww.superman.com";
        cell.indexpath = indexPath;
        cell.DelegateJournlist = self;
        return cell;
        
    }
    
    else
    {
        MainFeedCollectionViewCellBottom * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellBottom forIndexPath:indexPath];
        if (_IsapiHit == NO) {
            
            cell.ImageVIewBack.image = [UIImage imageNamed:[_arrayDataBottom objectAtIndex:indexPath.row]];

            cell.labelName.text=@"Superman";
            cell.labelDetails.text= @"Coming Soon";
            cell.labelWebsite.text = @"wwww.superman.com";
        }
        else
        {
        
        FeedModal * modal = [_arrayDataBottom objectAtIndex:indexPath.row];
        
        cell.labelName.text= modal.FeedModal_title;
        cell.labelDetails.text= @"";
        cell.labelWebsite.text = @"";
        [cell.ImageVIewBack sd_setImageWithURL:[NSURL URLWithString:[self getimageUrl:modal.FeedModal_description]]];
        }
        
        return cell;
        
    }
    
}


-( NSString *)getimageUrl :(NSString *)strText
{
    
    __block NSString *image = @"";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<img\\s[\\s\\S]*?src\\s*?=\\s*?['\"](.*?)['\"][\\s\\S]*?>)+?"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];

    [regex enumerateMatchesInString:strText
                            options:0
                              range:NSMakeRange(0, [strText length])
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             
                             NSString *img = [strText substringWithRange:[result rangeAtIndex:2]];
                             NSLog(@"img src %@",img);
                             image = img;
                             //[cell.ImageVIewBack sd_setImageWithURL:[NSURL URLWithString:img]];
                         }];

    return image;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_collectionViewTop == collectionView) {

    PostViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:@"PostViewController"];
    [self presentViewController:VC animated:YES completion:nil];
    }
    else
    {
        if (_IsapiHit == YES) {
         
            [self performSegueWithIdentifier:@"SegueWebsite" sender:indexPath];

        }

    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_collectionViewTop == collectionView) {
        
        return CGSizeMake(self.collectionViewTop.frame.size.width/1.4,self.collectionViewTop.frame.size.height);
    }
    else
    {
        return CGSizeMake((self.collectionViewBottom.frame.size.width/2)-7.5,(self.collectionViewBottom.frame.size.height/1.6)-5);
    }
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{

    if (_collectionViewTop != collectionView) {

    return UIEdgeInsetsMake(0, 5,0, 5);
    }
    else
    {
        return UIEdgeInsetsMake(0, 0,0, 0);

    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * indexpath = sender;
    FeedModal * obj = [_arrayDataBottom objectAtIndex:indexpath.row];
    
    [segue.destinationViewController GetUrl:obj.FeedModal_link];
}

#pragma mark - Custom Delegate

-(void)BtnJournlistClicked:(NSIndexPath *)indepath
{
    [self performSegueWithIdentifier:SegueJournalist sender:self];
}

#pragma mark - IBAction

- (IBAction)actionBtnGroup:(id)sender {
    [[[UIAlertView alloc]initWithTitle:@"" message:@"Coming soon" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil]show];
}

- (IBAction)actionBtnProfile:(id)sender {
    CategoryViewConroller * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryViewConroller"];
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)actionBnFilter:(id)sender {
    
    
    CategoryViewConroller * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryViewConroller"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)actionFeed:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"iApp_sidePanelOpen" object:nil];

}

@end
