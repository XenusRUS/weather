//
//  ViewController.m
//  weather
//
//  Created by admin on 11.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import "ViewController.h"
#import "WeatherCell.h"
#import "CityListTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    float _celsiusChelyabinsk;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.cityName;
    
    maxTempArray = [NSMutableArray new];
    minTempArray = [NSMutableArray new];
    dayArray = [NSMutableArray new];
    cityListArray = [NSArray arrayWithObjects:@"55.164442,61.436843", @"55.755826,37.617300", @"59.934280,30.335099", @"56.501040,84.992451", @"43.173739,132.006451", nil];
    NSString *cityListString;
    
    if ([self.title isEqual: @"Челябинск"]) {
        cityListString = [cityListArray objectAtIndex:0];
    }
    else if ([self.title isEqual: @"Москва"]) {
        cityListString = [cityListArray objectAtIndex:1];
    }
    else if ([self.title isEqual: @"Санкт-Петербург"]) {
        cityListString = [cityListArray objectAtIndex:2];
    }
    else if ([self.title isEqual: @"Томск"]) {
        cityListString = [cityListArray objectAtIndex:3];
    }
    else if ([self.title isEqual: @"Владивосток"]) {
        cityListString = [cityListArray objectAtIndex:4];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/1ad7112d7b90b4f0effa8a3d08861318/%@",cityListString];
    
    NSError *error;
    
    NSURLResponse *response;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] returningResponse:&response error:&error];
    
    if (data) {
        //currently
        NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSData *currentData = [jsonData valueForKey:@"currently"];
        NSString *temperatureString = [currentData valueForKey:@"temperature"];
        float fahrenheit = temperatureString.floatValue;
        _celsiusChelyabinsk = (fahrenheit-32.0)*(5.0/9.0);
        NSLog(@"Температура в Челябинске по Цельсию:%.2f", _celsiusChelyabinsk);
        NSLog(@"Температура в Челябинске по Фаренгейту:%.2f", fahrenheit);
        _curLbl.text = [NSString stringWithFormat:@"%.2f°C", _celsiusChelyabinsk];
        
        NSData *dayData = [jsonData valueForKey:@"daily"];
        NSArray *dataArray = [dayData valueForKey:@"data"];
        
        NSDate *current = [NSDate date];
        NSInteger weekday = [[[NSCalendar currentCalendar]components:NSCalendarUnitWeekday fromDate:current]weekday];
        
        for (int i=0; i< dataArray.count; i++) {
            NSData *tmpData = [dataArray objectAtIndex:i];
            
            NSString *minText = [tmpData valueForKey:@"temperatureMin"];
            NSString *maxText = [tmpData valueForKey:@"temperatureMax"];
            
            NSString *minValue = [self getCelsius:minText.floatValue];
            NSString *maxValue = [self getCelsius:maxText.floatValue];
            
            [minTempArray addObject:minValue];
            [maxTempArray addObject:maxValue];
            
            int day = (int)weekday+i;
            [dayArray addObject:[self getShortCutForDay:day]];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *identifier = @"weatherCell";
    WeatherCell *cell = (WeatherCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WeatherCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.minLbl.text = [NSString stringWithFormat:@"Ночью: %@°C", [minTempArray objectAtIndex:indexPath.row]];
    cell.maxLbl.text = [NSString stringWithFormat:@"Днем: %@°C", [maxTempArray objectAtIndex:indexPath.row]];
    cell.dayLbl.text = [NSString stringWithFormat:@"%@", [dayArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return minTempArray.count;
}

- (NSString *)getShortCutForDay:(int)day {
    NSString *shortCut = [NSString new];
    
    if (day>7) {
        day = day-7;
    }
    switch (day) {
        case 1:
            shortCut = @"Воскресенье";
            break;
        case 2:
            shortCut = @"Понедельник";
            break;
        case 3:
            shortCut = @"Вторник";
            break;
        case 4:
            shortCut = @"Среда";
            break;
        case 5:
            shortCut = @"Четверг";
            break;
        case 6:
            shortCut = @"Пятница";
            break;
        case 7:
            shortCut = @"Суббота";
            break;
            
        default:
            break;
    }
    return shortCut;
}

- (IBAction)optioPressed:(UIButton *)sender { NSArray *itemsToGo = @[@"Apple", @"Orange", @"Pen-apple"]; CityListTableViewController *vcToGo = [[CityListTableViewController alloc] init]; vcToGo.items = itemsToGo; [self.navigationController pushViewController:vcToGo animated:YES]; }


- (NSString *)getCelsius:(float)fahrenheit {
    NSString *returnString = [NSString stringWithFormat:@"%.1f",(fahrenheit-32.0)*(5.0/9.0)];
    return returnString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
