//
//  ViewController.m
//  facebook
//
//  Created by yujing on 16/3/30.
//  Copyright © 2016年 yujing. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareDialog.h>
#import <FBSDKShareKit/FBSDKShareLinkContent.h>

@interface ViewController ()<FBSDKSharingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)dialogShare:(id)sender {
    
    FBSDKShareDialog *shareDialog = [[FBSDKShareDialog alloc] init];
    shareDialog.fromViewController = self;
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc]init];
    content.contentURL =[NSURL URLWithString:@"https://www.facebook.com"];
    content.contentDescription =@"sharedescription";
    content.contentTitle =@"sharecaption";
    // content.imageURL =[NSURL URLWithString:pictureurl];
    
    shareDialog.shareContent = content;
    shareDialog.delegate = self;
    [shareDialog show];

    
}

-(void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results{
    
    NSLog(@"Complete");
    
}

-(void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error{
    
    NSLog(@"Fail");
    
}

-(void)sharerDidCancel:(id<FBSDKSharing>)sharer{
    
    NSLog(@"Cancel");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
