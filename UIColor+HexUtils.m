//
//  UIColor+HexUtils.m
//  Color Clock
//
//  Created by Diogo Magalhães Martins on 9/7/16.
//  Copyright © 2016 Diogo Martins. All rights reserved.
//

#import "UIColor+HexUtils.h"

@implementation UIColor (HexUtils)

+(NSString *)hexFromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);

    int red = round(components[0] * 255);
    int green = round(components[1] * 255);
    int blue = round(components[2] * 255);

    return [NSString stringWithFormat:@"#%02x%02x%02x", red, green, blue];
}

+(CGFloat)colorComponentFromInt:(int)value maxValue:(int)maxValue
{
    return ((MAX_COLOR_VALUE * value) / maxValue) / MAX_COLOR_VALUE;
}


@end
