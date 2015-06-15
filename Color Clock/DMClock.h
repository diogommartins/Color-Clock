//
//  DMClock.h
//  Colour Clock
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DMClockDelegate <NSObject>

- (void)clockDidUpdate;

@end

@interface DMClock : NSObject

@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) float interval;
@property (assign, nonatomic) id <DMClockDelegate> delegate;

@property int hours;
@property int minutes;
@property int seconds;

-(instancetype)initWithTimeInterval: (float)interval
                           delegate: (id <DMClockDelegate>)delegate;

-(void)start;
-(void)stop;

@end
