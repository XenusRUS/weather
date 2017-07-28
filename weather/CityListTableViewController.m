//
//  CityListTableViewController.m
//  weather
//
//  Created by admin on 16.06.16.
//  Copyright © 2016 vadim. All rights reserved.
//

#import "CityListTableViewController.h"
#import "ViewController.h"

@interface CityListTableViewController ()


@end

@implementation CityListTableViewController {
    NSInteger *_indexPathCell;
    NSArray *_cityArray;
    NSString *_cityString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cityArray = [NSArray arrayWithObjects:@"Челябинск", @"Москва", @"Санкт-Петербург", @"Томск", @"Владивосток", nil];
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_cityArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"weatherInfo"]) {
//        ViewController *viewController = segue.destinationViewController;
//        viewController.delegate = self;
        
//        _cityString = _cityArray;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    _indexPathCell = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    [self.navigationController pushViewController:viewController animated:YES];
    
    viewController.cityName = [_cityArray objectAtIndex:indexPath.row];
    
//    [self performSegueWithIdentifier:@"weatherInfo" sender:@"weatherInfo"];
//    [self.tableView indexPathForSelectedRow];
}

//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    //    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"]];
//    if([segue.identifier isEqualToString:@"weatherInfo"]){
//        ViewController *controller = (ViewController *)segue.destinationViewController;
//        controller.citySelect = [cityListArray objectAtIndex:_indexPathCell];
//    }
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
