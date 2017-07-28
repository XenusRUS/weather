//
//  CityListTableViewController.h
//  weather
//
//  Created by admin on 16.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface CityListTableViewController : UITableViewController <CityDelegate>
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@property (nonatomic, strong) NSArray *items;
@end
