//
//  PlayerSets.h
//  mp3player
//
//  Created by Rahul on 11/08/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "CircularSlide.h"


@interface PlayerSets : UIViewController
{
    AVAudioPlayer * audioplay;
    MPVolumeView * volume1;
    CircularSlide *sliderView;
}


/* ------------------- Labels ---------------- */
@property (strong, nonatomic) IBOutlet UILabel *time;



/* ------------------- sliders ---------------- */
@property (strong, nonatomic) IBOutlet UISlider *duration;
@property (strong, nonatomic) IBOutlet UISlider *volume;


/* ------------------ Buttons --------------- */
@property (strong, nonatomic) IBOutlet UIButton *play;
@property (strong, nonatomic) IBOutlet UIButton *stop;
@property (strong, nonatomic) IBOutlet UIButton *info;
@property (strong, nonatomic) IBOutlet UIButton *list;
@property (strong, nonatomic) IBOutlet UIButton *prev;
@property (strong, nonatomic) IBOutlet UIButton *next;


@end
