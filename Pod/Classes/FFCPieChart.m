//
//  FFCPieChart.m
//  Pods
//
//  Created by Fabian Canas on 10/15/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "FFCPieChart.h"

@interface FFCPieChart ()
@property (assign, nonatomic) CGFloat sum;
@end

@implementation FFCPieChart

/* colors thanks to https://github.com/mrmrs/colors
 # Cool Colors
 aqua: '#7FDBFF'
 blue: '#0074D9'
 lime: '#01FF70'
 navy: '#001F3F'
 teal: '#39CCCC'
 olive: '#3D9970'
 green: '#2ECC40'
 
 # Warm Colors
 red: '#FF4136'
 maroon: '#85144B'
 orange: '#FF851B'
 purple: '#B10DC9'
 yellow: '#FFDC00'
 fuchsia: '#F012BE'
 
 # Gray Scale Colors
 gray: '#aaa'
 white: '#fff'
 black: '#111'
 silver: '#ddd'
 */

+ (NSArray *)coolPalette
{
    return @[[UIColor colorWithRed:0x7f/255. green:0xdb/255. blue:0xff/255. alpha:1],
             [UIColor colorWithRed:0x00/255. green:0x74/255. blue:0xd9/255. alpha:1],
             [UIColor colorWithRed:0x01/255. green:0xff/255. blue:0x70/255. alpha:1],
             [UIColor colorWithRed:0x00/255. green:0x1f/255. blue:0x3f/255. alpha:1],
             [UIColor colorWithRed:0x39/255. green:0xcc/255. blue:0xcc/255. alpha:1],
             [UIColor colorWithRed:0x3d/255. green:0x99/255. blue:0x70/255. alpha:1],
             [UIColor colorWithRed:0x2e/255. green:0xcc/255. blue:0x40/255. alpha:1],
             ];
}

+ (NSArray *)warmPalette
{
    return @[[UIColor colorWithRed:0xff/255. green:0x41/255. blue:0x36/255. alpha:1],
             [UIColor colorWithRed:0x85/255. green:0x14/255. blue:0x4b/255. alpha:1],
             [UIColor colorWithRed:0xff/255. green:0x85/255. blue:0x1b/255. alpha:1],
             [UIColor colorWithRed:0xb1/255. green:0x0d/255. blue:0xc9/255. alpha:1],
             [UIColor colorWithRed:0xff/255. green:0xdc/255. blue:0x00/255. alpha:1],
             [UIColor colorWithRed:0xf0/255. green:0x12/255. blue:0xbe/255. alpha:1],
             ];
}

+ (NSArray *)grayPalette
{
    return @[[UIColor colorWithRed:0xa/16. green:0xa/16. blue:0xa/16. alpha:1],
             [UIColor colorWithRed:0xf/16. green:0xf/16. blue:0xf/16. alpha:1],
             [UIColor colorWithRed:0x1/16. green:0x1/16. blue:0x1/16. alpha:1],
             [UIColor colorWithRed:0xd/16. green:0xd/16. blue:0xd/16. alpha:1],
             ];
}

- (void)setDataItems:(NSArray *)dataItems
{
    _dataItems = [dataItems copy];
    _sum = 0;
    [_dataItems enumerateObjectsUsingBlock:^(id<FFCPieChartDataItem> obj, NSUInteger idx, BOOL *stop) {
        _sum += [obj doubleValue];
    }];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSArray *palette = [self palette]?:[FFCPieChart coolPalette];
    CGFloat stroke = 5;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGSize size = CGRectInset(self.bounds, stroke/2., stroke/2.).size;
    CGFloat radius = MIN(size.width, size.height)/2.;
    
    CGFloat innerRadius = 0.;
    if (_pieHole > 0. && _pieHole < 1.) {
        innerRadius = radius * _pieHole;
    }
    
    CGFloat __block currentAngle = 0;
    CGFloat __block targetAngle;
    NSUInteger paletteSize = [palette count];
    
    [[self dataItems] enumerateObjectsUsingBlock:^(id<FFCPieChartDataItem> obj, NSUInteger idx, BOOL *stop) {
        targetAngle = currentAngle + [obj doubleValue] * 2 * M_PI / _sum;
        
        CGContextBeginPath(ctx);
        
        if (innerRadius == 0) {
            CGContextMoveToPoint(ctx, center.x, center.y);
        } else {
            CGContextAddArc(ctx, center.x, center.y, innerRadius, targetAngle, currentAngle, 1);
        }
        
        CGContextAddArc(ctx, center.x, center.y, radius, currentAngle, targetAngle, 0);
        CGContextClosePath(ctx);
        
        UIColor *color = nil;
        
        if ([obj respondsToSelector:@selector(color)]) {
            color = [obj color];
        } else {
            color = palette[idx % paletteSize];
        }
        
        CGContextSetFillColorWithColor(ctx, [color CGColor]);
        CGContextDrawPath(ctx, kCGPathFillStroke);
        
        currentAngle = targetAngle;
    }];
}

@end
