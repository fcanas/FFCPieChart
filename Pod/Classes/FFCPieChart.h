//
//  FFCPieChart.h
//  Pods
//
//  Created by Fabian Canas on 10/15/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

/**
 A protocol.
 */
@protocol FFCPieChartDataItem <NSObject>
- (CGFloat)doubleValue;
@optional
- (UIColor *)color;
@end

@interface FFCPieChart : UIView
+ (NSArray *)coolPalette;
+ (NSArray *)warmPalette;
+ (NSArray *)grayPalette;

/**
 An array of UIColor objects that will be used sequentially to
 fill in segments of the pie chart for data items that do not
 specify their own color.
 */
@property (nonatomic, copy) NSArray *palette;

/**
 An array of objects conforming to FFCPieChartDataItem.

 @see FFCPieChartDataItem
 */
@property (nonatomic, copy) NSArray *dataItems;
@end
