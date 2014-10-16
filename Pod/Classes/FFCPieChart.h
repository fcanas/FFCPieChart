//
//  FFCPieChart.h
//  Pods
//
//  Created by Fabian Canas on 10/15/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@protocol FFCPieChartDataItem <NSObject>
@optional
- (CGFloat)doubleValue;
@end

@interface FFCPieChart : UIView
+ (NSArray *)coolPalette;
+ (NSArray *)warmPalette;
+ (NSArray *)grayPalette;
@property (nonatomic, copy) NSArray *palette;
@property (nonatomic, copy) NSArray *dataItems;
@end
