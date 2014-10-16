//
//  FFCPieChart.m
//  Pods
//
//  Created by Fabian Canas on 10/15/14.
//
//

#import "FFCPieChart.h"

@implementation FFCPieChart

+ (NSArray *)defaultPalette
{
    return @[[UIColor blueColor]];
}

- (void)drawRect:(CGRect)rect {
    CGFloat stroke = 5;
    
    CGSize size = self.bounds.size;
    
    CGPoint center = CGPointMake(size.width/2., size.height/2.);
    
    size.width = size.width - stroke/2.;
    size.height = size.height - stroke/2.;
    
    CGFloat radius = size.width/2.;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor cyanColor].CGColor);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextBeginPath(ctx);
    
    CGFloat currentAngle = 0;
    CGFloat targetAngle = M_PI/4.;
    
    ///
    
    CGPoint startPoint = pointForAngle(currentAngle, radius, center);
    CGPoint endPoint = pointForAngle(targetAngle, radius, center);
    
    CGContextMoveToPoint(ctx, center.x, center.y);
    
    CGContextAddArc(ctx, center.x, center.y, radius, currentAngle, targetAngle, 0);
    
    CGContextClosePath(ctx);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
                      
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(startPoint.x - 2., startPoint.y - 2, 4, 4));
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(endPoint.x - 2., endPoint.y - 2, 4, 4));
}

CGPoint pointForAngle(CGFloat angle, CGFloat radius, CGPoint center)
{
    return CGPointMake(cos(angle) * radius + center.x,
                       sin(angle) * radius + center.y);
}

@end
