//
//  PlayerSets.m
//  mp3player
//
//  Created by Rahul on 11/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "PlayerSets.h"
#import "CircularSlide.h"
#import "Info.h"
#import "SongsList.h"
#import <QuartzCore/QuartzCore.h>

@interface PlayerSets ()
{
    UIImageView *slowAnimationImageView;
    Info *inform;
    SongsList * list;
}

@end

@implementation PlayerSets


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
    
    volume1 = [[MPVolumeView alloc]init];

    self.play.layer.cornerRadius = 75.0f;
    self.stop.layer.cornerRadius = 75.0f;
    self.list.layer.cornerRadius = 5.0f;
    self.prev.layer.cornerRadius = 5.0f;
    self.next.layer.cornerRadius = 5.0f;
    
    
    sliderView = [[CircularSlide alloc] initWithMinValue:0 maxValue:100 initialValue:[audioplay duration]];
    sliderView.frame = CGRectMake(80, 200, 160, 170);
   // [self.view addSubview:sliderView];
    NSBundle * mainbundle = [NSBundle mainBundle];
    NSString * filepath = [mainbundle pathForResource:@"Galliyan" ofType:@"mp3"];
    NSData * filedata = [NSData dataWithContentsOfFile:filepath];
    audioplay = [[AVAudioPlayer alloc]initWithData:filedata error:nil];
    //[audioplay prepareToPlay];
    //audioplay.numberOfLoops = -1;
  //  [sliderView addSubview:self.play];
   
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    self.duration.maximumValue = [audioplay duration];
    
    
    
    [self.volume addTarget:self action:@selector(volumeSliderMoved:) forControlEvents:UIControlEventValueChanged];
    
    [self.duration addTarget:self action:@selector(durationSliderMoved:) forControlEvents:UIControlEventValueChanged];
    
    [self searchSongs:self];
    
    
    
    
    
        /* ---------------------- Animating Mug -------------------- */
    
    NSArray *imageNames = @[@"1.png", @"2.png", @"3.png", @"4.png",
                            @"5.png", @"6.png", @"7.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++)
    {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 270, 100, 200)];
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 3;
    
    //[self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
    
    
     /* ---------------------- Stop Animating Mug -------------------- */
    
}


- (void)volumeSliderMoved:(UISlider *)sender
{
	audioplay.volume = self.volume.value;
}

- (void)durationSliderMoved:(UISlider *)sender
{
    audioplay.currentTime = self.duration.value;
    [audioplay playAtTime:audioplay.currentTime];
}

- (void)updateTime:(NSTimer *)timer
{
    self.duration.value = audioplay.currentTime;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender
{
    audioplay.currentTime = self.duration.value;
    [audioplay play];
    BOOL play = YES;
    
    if ([audioplay play] == play)
    {
        self.play.userInteractionEnabled = NO;
    }
    
}
- (IBAction)stop:(id)sender
{
    [audioplay stop];
}

- (void)searchSongs:(id)sender
{
    
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    NSFileManager *filemgr = [[NSFileManager alloc] init];
    
    NSArray *allFiles = [filemgr contentsOfDirectoryAtPath:bundlePath error:NULL];
    for (NSString *fileName in allFiles)
    {
        if ([[fileName pathExtension] isEqualToString:@"mp3"])
        {
            NSString *fullFilePath = [bundlePath stringByAppendingPathComponent:fileName];
            //do whatever you want to do with the path
            NSLog(@"file name: %@",fullFilePath);
            self.time.text = [NSString stringWithFormat:@"Playing: %@",fileName];
        }
    }
}


- (IBAction)list:(id)sender
{
    list = [[SongsList alloc]initWithNibName:@"SongsList" bundle:nil];
    [self presentViewController:list animated:YES completion:nil];
}

- (IBAction)info:(id)sender
{
    inform = [[Info alloc]initWithNibName:@"Info" bundle:nil];
    [self presentViewController:inform animated:YES completion:nil];
}
- (IBAction)next:(id)sender {
}
- (IBAction)prev:(id)sender {
}

@end
