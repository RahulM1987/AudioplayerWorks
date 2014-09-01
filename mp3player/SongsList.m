//
//  SongsList.m
//  mp3player
//
//  Created by Rahul on 12/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "SongsList.h"
#import "PlayerSets.h"

@interface SongsList ()
{
    PlayerSets * player;
}
@end

@implementation SongsList
@synthesize  songslist;

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
    //self.songslist.backgroundColor = [UIColor clearColor];
    [self searchSongs:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
  
    NSString * CellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [defaults valueForKey:@"filename"];
    //NSLog(@"In list: %@",);
    return cell;
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSLog(@"Selected: %ld",(long)indexPath.row+1);
    NSLog(@"Selected: %@",[allFiles objectAtIndex:indexPath.row]);
    
}

- (void)searchSongs:(id)sender
{
    
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    NSFileManager *filemgr = [[NSFileManager alloc] init];
    
     allFiles = [filemgr contentsOfDirectoryAtPath:bundlePath error:NULL];
    for (fileName in allFiles)
    {
        if ([[fileName pathExtension] isEqualToString:@"mp3"])
        {
            NSString *fullFilePath = [bundlePath stringByAppendingPathComponent:fileName];
            //do whatever you want to do with the path
            NSLog(@"file name: %@",fileName);
            list = [[NSMutableArray alloc]init];
             defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:fileName forKey:@"filename"];
            NSLog(@"stored: %@",[defaults valueForKey:@"filename"]);
            [list addObject:fileName];
            [defaults setObject:list forKey:@"filename1"];
            NSLog(@"stored: %@",[list objectAtIndex:0]);

            
        }
    }
}


//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(indexPath.row %2 == 0)
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//    }
//    else
//    {
//        cell.backgroundColor=[UIColor colorWithRed:240/255.0 green:250/255.0 blue:255/255.0 alpha:1];
//    }
//
//}

- (IBAction)back:(id)sender
{
    player = [[PlayerSets alloc]initWithNibName:@"PlayerSets" bundle:nil];
    [self presentViewController:player animated:YES completion:nil];
}


@end
