//
//  GearViewController.m
//  CSGO
//
//  Created by Wizbu on 14.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "GearViewController.h"
#import "SQLiteManager.h"
@interface GearViewController ()

@end

@implementation GearViewController
{
    SQLiteManager *dbmanager;
    NSArray *gear;
    
}



- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = NO;
    [super viewDidLoad];
    self.title = @"Gears";
    
    gear = [NSArray new];
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM Gear "];
    
    [dbmanager openDatabase];
    gear = [dbmanager getRowsForQuery:query];
    [dbmanager closeDatabase];
    
    
    NSLog(@"%@",gear);
    
//    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return gear.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImage *myGear = [UIImage imageNamed:[gear objectAtIndex:indexPath.row][@"g_image"]];
    
    
    cell.textLabel.text = [gear objectAtIndex:indexPath.row][@"g_name"];
    cell.imageView.image = myGear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [SharedVariables sharedObject].gearID = gear[indexPath.row][@"id"];
    [SharedVariables sharedObject].gearName = gear[indexPath.row][@"g_name"];

    
    
    
}


@end
