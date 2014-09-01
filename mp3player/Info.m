//
//  Info.m
//  mp3player
//
//  Created by Rahul on 12/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "Info.h"
#import "PlayerSets.h"
#import "SVProgressHUD.h"

@interface Info ()

@end

@implementation Info

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Info did load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)mail:(id)sender
{
    MFMailComposeViewController * mail =[[MFMailComposeViewController alloc]init];
    mail.mailComposeDelegate = self;
    [mail setToRecipients:@[@"mp3playerfeedback@gmail.com"]];
    [mail setSubject:@"About MP3 Player"];
    [mail setMessageBody:@"Hi Rahul" isHTML:NO];
    if (mail)
        [self presentViewController:mail animated:YES completion:nil];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
     [SVProgressHUD showWithStatus:@"Please wait"];
    if (result == MFMailComposeResultSent) {
        NSLog(@"Mail sent!");
        [SVProgressHUD dismissWithSuccess:@"Mail Sent"];
    }
    [SVProgressHUD dismiss];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




@end
