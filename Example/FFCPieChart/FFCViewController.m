//
//  FFCViewController.m
//  FFCPieChart
//
//  Created by Fabian Canas on 10/15/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "FFCViewController.h"

@interface FFCViewController ()

@end

@implementation FFCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topPieChart.palette = [FFCPieChart grayPalette];
    [self.topPieChart setDataItems:@[@2, @3, @4]];
    
    self.pieChart.palette = [FFCPieChart warmPalette];
    [self.pieChart setDataItems:@[@1, @2, @3, @4]];
    
    [self.bottomPieChart setDataItems:@[@17, @27, @13, @24, @32, @12, @55]];
}

@end
