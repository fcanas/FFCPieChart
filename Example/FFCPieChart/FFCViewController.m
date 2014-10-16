//
//  FFCViewController.m
//  FFCPieChart
//
//  Created by Fabian Canas on 10/15/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "FFCViewController.h"

@interface DataItem : NSObject<FFCPieChartDataItem>
@property (nonatomic, copy) UIColor *color;
@property (nonatomic, assign) CGFloat doubleValue;
@end

@implementation DataItem
- (instancetype)initWithColor:(UIColor *)color value:(CGFloat)value
{
    self = [super init];
    if (self) {
        _color = [color copy];
        _doubleValue = value;
    }
    return self;
}
@end


@interface FFCViewController ()

@end

@implementation FFCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataItem *dataItem = [[DataItem alloc] initWithColor:[UIColor redColor] value:0.4];
    
    self.topPieChart.palette = [FFCPieChart grayPalette];
    [self.topPieChart setDataItems:@[@2, @3, @4, dataItem]];
    
    self.pieChart.palette = [FFCPieChart warmPalette];
    [self.pieChart setDataItems:@[@1, @2, @3, @4]];
    
    [self.bottomPieChart setDataItems:@[@17, @27, @13, @24, @32, @12, @55]];
}

@end
