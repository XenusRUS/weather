//
//  WeatherCell.h
//  weather
//
//  Created by admin on 11.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *dayLbl;
@property(nonatomic,weak)IBOutlet UILabel *minLbl;
@property(nonatomic,weak)IBOutlet UILabel *maxLbl;

@end
