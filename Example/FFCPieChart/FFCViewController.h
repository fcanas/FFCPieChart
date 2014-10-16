//
//  FFCViewController.h
//  FFCPieChart
//
//  Created by Fabian Canas on 10/15/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FFCPieChart/FFCPieChart.h>

@interface FFCViewController : UIViewController
@property (weak, nonatomic) IBOutlet FFCPieChart *pieChart;
@property (weak, nonatomic) IBOutlet FFCPieChart *topPieChart;
@property (weak, nonatomic) IBOutlet FFCPieChart *bottomPieChart;

@end
