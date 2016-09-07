//
//  ViewController.m
//  Colour Clock
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "ClockViewController.h"
#define BRIGHTNESS_INCREASE 10
#define MAX_COLOR_VALUE 255.0

@interface ClockViewController ()

-(void)updateLabelsWithColor: (UIColor *) color;
-(void)updateBackgroundWithColor: (UIColor *) color;
-(CGFloat)colorComponentFromInt: (int)value maxValue:(int)maxValue;

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

-(NSString *)hexFromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);

    int red = round(components[0] * 255);
    int green = round(components[1] * 255);
    int blue = round(components[2] * 255);

    return [NSString stringWithFormat:@"#%02x%02x%02x", red, green, blue];
}

-(void)updateLabelsWithColor: (UIColor *) color
{
    [self.lblHours setText: [NSString stringWithFormat:@"%02i", self.clock.hours]];
    [self.lblMinutes setText: [NSString stringWithFormat:@"%02i", self.clock.minutes]];
    [self.lblSeconds setText: [NSString stringWithFormat:@"%02i", self.clock.seconds]];

    [self.lblHexValue setText: [self hexFromColor:color]];
}

-(CGFloat)colorComponentFromInt:(int)value maxValue:(int)maxValue
{
    return ((MAX_COLOR_VALUE * value) / maxValue) / MAX_COLOR_VALUE;
}

-(void)updateBackgroundWithColor: (UIColor *) color
{
    [self.view setBackgroundColor: color];
}

# pragma mark - DMClockDelegate implementation

-(void)clockDidUpdate
{
    UIColor * color = [UIColor colorWithRed: [self colorComponentFromInt:self.clock.hours maxValue:24]
                                      green: [self colorComponentFromInt:self.clock.minutes maxValue:60]
                                       blue: [self colorComponentFromInt:self.clock.seconds maxValue:60]
                                      alpha: 1.0];

    [self updateLabelsWithColor: color];
    [self updateBackgroundWithColor: color];
}

@end
