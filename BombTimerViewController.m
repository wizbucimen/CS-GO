//
//  BombTimerViewController.m
//  CSGO
//
//  Created by Wizbu on 25.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "BombTimerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BombTimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *c4ImageLabel;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@end

@implementation BombTimerViewController{
    NSTimer *timer;
    float remainingCounts;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"Timer";
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                             target:self
                                           selector:@selector(bombExplode)
                                           userInfo:nil
                                            repeats:YES];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"]
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:nil
                                                                   action:@selector(settingsFunc)];
    
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    remainingCounts = 46.30;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bombSound" ofType:@"mp3"]];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [audioPlayer play];

    /*
     bomba 45 saniye
     son 10 saniye ses değişir
     5 saniye kala defuse kit ile 
     10 saniye kala kitsiz
     
     1 sn 
     30 dan sonra saniyede 2 
     20 den sonra saniyede 3 -15 e kadar

     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)settingsFunc{
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Test"] animated:YES];
}

-(void)bombExplode {
   
    remainingCounts = remainingCounts-0.1f;
    _c4ImageLabel.text = [NSString stringWithFormat:@"00.%.2f",remainingCounts];
    
    if (remainingCounts  <= 0.02) {
        [audioPlayer stop];

        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"allahu" ofType:@"mp3"]];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [audioPlayer play];
        
        [timer invalidate];
    }
}

- (IBAction)settingsButtonAction:(id)sender {
}

@end
