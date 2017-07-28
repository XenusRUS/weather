//
//  ViewController.h
//  weather
//
//  Created by admin on 11.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CityDelegate<NSObject>
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDelegate> {
    NSMutableArray *curTempArray;
    NSMutableArray *maxTempArray;
    NSMutableArray *minTempArray;
    NSMutableArray *dayArray;
    NSArray *cityListArray;
}
@property(nonatomic,weak)IBOutlet UILabel *curLbl;
@property(weak,nonatomic) NSString* citySelect;
@property (weak, nonatomic) id<CityDelegate> delegate;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSString *cityName;


@end