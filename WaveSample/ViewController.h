//
//  ViewController.h
//  WaveSample
//
//  Created by 古川 信行 on 2013/11/19.
//  Copyright (c) 2013年 古川 信行. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFrqL;
@property (weak, nonatomic) IBOutlet UITextField *txtFrqR;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrqL;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrqR;
@property (weak, nonatomic) IBOutlet UISwitch *swInvertL;
@property (weak, nonatomic) IBOutlet UISwitch *swInvertR;
@property (weak, nonatomic) IBOutlet UISlider *sliderVolume;
@property (weak, nonatomic) IBOutlet UIView *mpVolumeViewParentView;

- (IBAction)clickBtnRun:(id)sender;
- (IBAction)clickBtnSync:(id)sender;
- (IBAction)changedFrqL:(id)sender;
- (IBAction)changedFrqR:(id)sender;
- (IBAction)changeTxtFrqL:(id)sender;
- (IBAction)changeTxtFrqR:(id)sender;
- (IBAction)swInvertL:(id)sender;
- (IBAction)swInvertR:(id)sender;

@end
