//
//  SongsList.h
//  mp3player
//
//  Created by Rahul on 12/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongsList : UIViewController <UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray * list;
    NSString *fileName;
    NSUserDefaults * defaults;
    NSArray *allFiles;
}


@property (strong, nonatomic) IBOutlet UITableView *songslist;
@property (strong, nonatomic) IBOutlet UIButton *back;

@end
