//
//  Info.h
//  mp3player
//
//  Created by Rahul on 12/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface Info : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *close;
@property (strong, nonatomic) IBOutlet UIButton *mail;

@end
