//
//  WeatherCell.m
//  weather
//
//  Created by admin on 11.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import "WeatherCell.h"

@implementation WeatherCell
@synthesize  maxLbl,minLbl,dayLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
