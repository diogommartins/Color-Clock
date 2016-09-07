//
//  UIColor+HexUtils.h
//  Color Clock
//
//  Created by Diogo Magalhães Martins on 9/7/16.
//  Copyright © 2016 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MAX_COLOR_VALUE 255.0

@interface UIColor (HexUtils)

+(NSString *)hexFromColor:(UIColor *)color;
+(CGFloat)colorComponentFromInt:(int)value maxValue:(int)maxValue;

@end
