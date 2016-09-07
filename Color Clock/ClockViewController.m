//
//  ViewController.m
//  Colour Clock
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "ClockViewController.h"
#define BRIGHTNESS_INCREASE 10


@interface ClockViewController ()

-(void)updateLabelsWithColor: (UIColor *) color;
-(void)updateBackgroundWithColor: (UIColor *) color;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clock = [[DMClock alloc] initWithTimeInterval: 1.0
                                              delegate: self];
    [self.clock start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)updateLabelsWithColor: (UIColor *) color
{
    [self.lblHours setText: [NSString stringWithFormat:@"%02i", self.clock.hours]];
    [self.lblMinutes setText: [NSString stringWithFormat:@"%02i", self.clock.minutes]];
    [self.lblSeconds setText: [NSString stringWithFormat:@"%02i", self.clock.seconds]];

    [self.lblHexValue setText: [UIColor hexFromColor:color]];
}


-(void)updateBackgroundWithColor: (UIColor *) color
{
    [self.view setBackgroundColor: color];
}

# pragma mark - DMClockDelegate implementation

-(void)clockDidUpdate
{
    UIColor * color = [UIColor colorWithRed: [UIColor colorComponentFromInt:self.clock.hours maxValue:24]
                                      green: [UIColor colorComponentFromInt:self.clock.minutes maxValue:60]
                                       blue: [UIColor colorComponentFromInt:self.clock.seconds maxValue:60]
                                      alpha: 1.0];

    [self updateLabelsWithColor: color];
    [self updateBackgroundWithColor: color];
}

@end
