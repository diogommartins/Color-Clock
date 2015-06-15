//
//  ViewController.h
//  Colour Clock
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMClock.h"

@interface ClockViewController : UIViewController <DMClockDelegate>

@property (weak, nonatomic) IBOutlet UIView *shadowLayerView;
@property (weak, nonatomic) IBOutlet UILabel *lblHours;
@property (weak, nonatomic) IBOutlet UILabel *lblMinutes;
@property (weak, nonatomic) IBOutlet UILabel *lblSeconds;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblDividers;
@property (weak, nonatomic) IBOutlet UILabel *lblHexValue;

@property (strong, nonatomic) DMClock * clock;

@end

