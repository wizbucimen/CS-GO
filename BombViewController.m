//
//  BombViewController.m
//  CSGO
//
//  Created by Wizbu on 14.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "BombViewController.h"
#import "SharedVariables.h"
#import "BombTableViewCell.h"


@interface BombViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation BombViewController
{
    SQLiteManager *dbmanager;
    NSArray *bombs;
    
    
}



- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = NO;
    [super viewDidLoad];
    self.title = @"Bombs";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    bombs = [NSArray new];
    
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM Bomb "];
    
    [dbmanager openDatabase];
    bombs = [dbmanager getRowsForQuery:query];
    [dbmanager closeDatabase];
    
    
    NSLog(@"%@",bombs);
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return bombs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BombTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.photoImageView.image = [UIImage imageNamed:[bombs objectAtIndex:indexPath.row][@"b_image"]];
    cell.nameLabel.text = [bombs objectAtIndex:indexPath.row][@"b_name"];
    cell.priceLabel.text = [bombs objectAtIndex:indexPath.row][@"b_price"];


    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [SharedVariables sharedObject].bombsTypesID = bombs[indexPath.row][@"id"];
    [SharedVariables sharedObject].bombsTypesName = bombs[indexPath.row][@"b_name"];
    
    

    
}


@end
