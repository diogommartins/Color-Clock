//
//  DMClock.m
//  Colour Clock
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "DMClock.h"

@interface DMClock()

-(void) update;
-(int) timePieceWithFormat: (NSString *)format date:(NSDate *)date;

@end

@implementation DMClock

-(instancetype)initWithTimeInterval:(float)interval delegate:(id <DMClockDelegate>)delegate
{
    if (self = [super init]){
        self.delegate = delegate;
        self.interval = interval;
    }
    return self;
}

-(void)start
{
    [self update];
    self.timer = [NSTimer scheduledTimerWithTimeInterval: self.interval
                                                  target: self
                                                selector: @selector(update)
                                                userInfo: nil
                                                 repeats: YES];
}

-(void)update
{
    NSDate * date = [NSDate date];
    self.hours = [self timePieceWithFormat:@"HH" date: date];
    self.minutes = [self timePieceWithFormat:@"mm" date: date];
    self.seconds = [self timePieceWithFormat:@"ss" date: date];
    [self.delegate clockDidUpdate];
}

-(int)timePieceWithFormat:(NSString *)format date:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: format];
    
    return [[formatter stringFromDate: date] intValue];
}

-(void)stop
{
    [self.timer invalidate];
}

@end
