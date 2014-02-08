//
//  ViewController.m
//  WaveSample
//
//  Created by 古川 信行 on 2013/11/19.
//  Copyright (c) 2013年 古川 信行. All rights reserved.
//

#import "ViewController.h"
#import "VincluLed.h"

@interface ViewController (){
    VincluLed* waveUtil;
}

@end

@implementation ViewController
@synthesize txtFrqL,txtFrqR;
@synthesize sliderFrqL,sliderFrqR;
@synthesize swInvertL,swInvertR;
@synthesize sliderVolume;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初期化
    waveUtil = [[VincluLed alloc] initialize];
    waveUtil.frequencyL = sliderFrqL.value;
    waveUtil.frequencyR = sliderFrqR.value;

    // Do any additional setup after loading the view, typically from a nib.
    self.mpVolumeViewParentView.backgroundColor = [UIColor clearColor];
    MPVolumeView *myVolumeView =
    [[MPVolumeView alloc] initWithFrame: self.mpVolumeViewParentView.bounds];
    [self.mpVolumeViewParentView addSubview: myVolumeView];
}

- (void)viewDidUnload{
    //停止
    [waveUtil uninitialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedFrqL:(id)sender {
    waveUtil.frequencyL = ((UISlider*) sender).value;
    txtFrqL.text = [NSString stringWithFormat:@"%.0f",waveUtil.frequencyL];
}

- (IBAction)changedFrqR:(id)sender {
    waveUtil.frequencyR = ((UISlider*) sender).value;
    txtFrqR.text = [NSString stringWithFormat:@"%.0f",waveUtil.frequencyR];
}

- (IBAction)volumeL:(id)sender {
}

- (IBAction)clickBtnRun:(id)sender {
    if(waveUtil.isPlay == NO){
        //再生
        [waveUtil start];
        [((UIButton*) sender) setTitle:@"stop" forState:UIControlStateNormal];
    }
    else{
        //停止
        [waveUtil stop];
        [((UIButton*) sender) setTitle:@"play" forState:UIControlStateNormal];
    }
}

- (IBAction)clickBtnSync:(id)sender {
    //LにRを合わせる
    sliderFrqR.value = sliderFrqL.value;
    txtFrqR.text = [NSString stringWithFormat:@"%.0f",waveUtil.frequencyL];
    swInvertR.on = swInvertL.on;
    
    waveUtil.frequencyR =  sliderFrqR.value;
    waveUtil.invertR = waveUtil.invertL;
}

- (IBAction)changeTxtFrqL:(id)sender {
    float frequency = [((UITextField *) sender).text floatValue];
    
    sliderFrqL.value = frequency;
    waveUtil.frequencyL = sliderFrqL.value;
}

- (IBAction)changeTxtFrqR:(id)sender {
    float frequency = [((UITextField *) sender).text floatValue];
    
    sliderFrqR.value = frequency;
    waveUtil.frequencyR = sliderFrqR.value;
}

- (IBAction)swInvertL:(id)sender {
    UISwitch* sw = (UISwitch *) sender;
    waveUtil.invertL = sw.on;
}

- (IBAction)swInvertR:(id)sender {
    UISwitch* sw = (UISwitch *) sender;
    waveUtil.invertR = sw.on;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

@end
