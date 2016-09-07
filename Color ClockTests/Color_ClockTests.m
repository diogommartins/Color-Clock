//
//  Color_ClockTests.m
//  Color ClockTests
//
//  Created by Diogo Martins on 6/15/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UIColor+HexUtils.h"

@interface Color_ClockTests : XCTestCase

-(NSString *)hexColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
-(NSString *)hexColorFromHours:(int)hours minutes:(int)minutes seconds:(int)seconds;

@end

@implementation Color_ClockTests

-(NSString *)hexColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    UIColor *color = [UIColor colorWithRed:red
                                     green:green
                                      blue:blue
                                     alpha:1.0];

    return [UIColor hexFromColor: color];
}

-(NSString *)hexColorFromHours:(int)hours minutes:(int)minutes seconds:(int)seconds
{
    return [self hexColorWithRed: [UIColor colorComponentFromInt:hours maxValue:24]
                      green: [UIColor colorComponentFromInt:minutes maxValue:60]
                       blue: [UIColor colorComponentFromInt:seconds maxValue:60]];
}

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBlackColor {
    // This is an example of a functional test case.
    NSString *hex = [self hexColorFromHours:0 minutes:0 seconds:0];

    XCTAssert([hex isEqualToString:@"#000000"], @"Pass");
}

- (void)testWhiteColor{
    NSString *hex = [self hexColorFromHours:23 minutes:59 seconds:59];

    XCTAssert([hex isEqualToString:@"#f4fbfb"], @"Pass");
}

- (void)testMidleGrey{
//    UIColor *color =
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
