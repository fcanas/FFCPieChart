# FFCPieChart

[![CI Status](http://img.shields.io/travis/Fabian Canas/FFCPieChart.svg?style=flat)](https://travis-ci.org/Fabian Canas/FFCPieChart)
[![Version](https://img.shields.io/cocoapods/v/FFCPieChart.svg?style=flat)](http://cocoadocs.org/docsets/FFCPieChart)
[![License](https://img.shields.io/cocoapods/l/FFCPieChart.svg?style=flat)](http://cocoadocs.org/docsets/FFCPieChart)
[![Platform](https://img.shields.io/cocoapods/p/FFCPieChart.svg?style=flat)](http://cocoadocs.org/docsets/FFCPieChart)

Pie charts in iOS.

```
// self.topPieChart = [[FFCPieChart alloc] initWithFrame:...];
// self.middlePieChart = etc.

self.topPieChart.palette = [FFCPieChart grayPalette];
[self.topPieChart setDataItems:@[@2, @3, @4]];

self.middlePieChart.palette = [FFCPieChart warmPalette];
[self.middlePieChart setDataItems:@[@1, @2, @3, @4]];

[self.bottomPieChart setDataItems:@[@17, @27, @13, @24, @32, @12, @55]];
```

<img src="https://raw.github.com/fcanas/FFCPieChart/master/3Charts.png" alt="Vertical Layout" width="321" />
<!--![](/3Charts.png) -->

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FFCPieChart will be available through [CocoaPods](http://cocoapods.org). To install
it until then, add the following line to your Podfile:

pod "FFCPieChart", git: 'https://github.com/fcanas/FFCPieChart.git'

## Author

[Fabian Canas](https://github.com/fcanas) ([@fcanas](https://twitter.com/fcanas))

## License

FFCPieChart is available under the MIT license. See the LICENSE file for more info.

