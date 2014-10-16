//
//  FFCPieChart.h
//  Pods
//
//  Created by Fabian Canas on 10/15/14.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@protocol FFCPieChartDataItem <NSObject>
@optional
- (CGFloat)floatValue;
@end

@interface FFCPieChart : UIView
@property (nonatomic, copy) NSArray *dataItems;
@end
