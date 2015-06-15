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

-(void)dropShadowOnView: (UIView *)view;
-(void) updateLabels;
-(void) updateBackgroundColor;
-(CGFloat)colorFromInt: (int)value;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dropShadowOnView: self.shadowLayerView];
    self.clock = [[DMClock alloc] initWithTimeInterval:1.0 delegate: self];
    [self.clock start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dropShadowOnView:(UIView *)view
{
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.masksToBounds = YES;
    shadowLayer.shadowOffset = CGSizeMake(0, 3);
    shadowLayer.shadowRadius = 150.0f;
    shadowLayer.shadowOpacity = 0.5f;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect: view.bounds].CGPath;
    shadowLayer.cornerRadius = 3; // if you like rounded corners
    shadowLayer.frame = view.layer.bounds;
    
    [view.layer addSublayer:shadowLayer];
}

-(void)updateLabels
{
    [self.lblHours setText: [NSString stringWithFormat:@"%02i", self.clock.hours]];
    [self.lblMinutes setText: [NSString stringWithFormat:@"%02i", self.clock.minutes]];
    [self.lblSeconds setText: [NSString stringWithFormat:@"%02i", self.clock.seconds]];
    [self.lblHexValue setText: [NSString stringWithFormat:@"#%02x%02x%02x", self.clock.hours,
                                self.clock.minutes, self.clock.seconds]];
}

-(CGFloat)colorFromInt:(int)value
{
    return value / 255.0 * BRIGHTNESS_INCREASE;
}

-(void)updateBackgroundColor
{
    UIColor * color = [UIColor colorWithRed: [self colorFromInt:self.clock.hours]
                                      green: [self colorFromInt:self.clock.minutes]
                                       blue: [self colorFromInt:self.clock.seconds]
                                      alpha: 10.0];
    [self.view setBackgroundColor: color];
}

-(void)clockDidUpdate
{
    [self updateLabels];
    [self updateBackgroundColor];
}

@end
