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
 A loose protocl an object may adopt to represent slices of information in an
 @p FFCPieChart.
 
 An @p FFCPieChartDataItem may be added to an @p FFCPieChart via the pie chart's
 @p dataItem property. A data item must respond to the @p doubleValue selector.
 All other methods are optional and used for configuring the slice's appearance.
 */
@protocol FFCPieChartDataItem <NSObject>
/**
 The value of the data item.

 Note that this is not a percent, or a proportion of any specific number range.
 It does not represent a proportion from 0 to 1, nor from 0 to 100. The proportion
 represented by a data item is strictly in relation to other data items added to
 the pie chart.
 */
- (CGFloat)doubleValue;
@optional
/**
 The color to fill the data slice with. If none is provided, the pie chart will 
 automatically select a color.
 */
- (UIColor *)color;
@end

@interface FFCPieChart : UIView
+ (NSArray *)coolPalette;
+ (NSArray *)warmPalette;
+ (NSArray *)grayPalette;

/**
 An array of UIColor objects used sequentially to fill in segments of 
 the pie chart for data items that do not specify their own color.
 
 Defaults to @p nil. When @nil, the pie chart acts as though it palette is 
 @p coolPalette.
 */
@property (nonatomic, copy) NSArray *palette;

/**
 An array of objects loosely conforming to @p FFCPieChartDataItem. A data item
 need only respond to the @p doubleValue selector.
 
 The pie chart will render each data item as a slice of the pie chart. Each item's
 proportion is calculated against the sum of all data items' values.
 

 @p FFCPieChart does not enforce conformance to the @pFFCPieChartDataItem
 protocol.

 @see FFCPieChartDataItem
 */
@property (nonatomic, copy) NSArray *dataItems;
@end
