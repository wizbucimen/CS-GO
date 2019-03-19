//
//  WeaponsViewController.m
//  CSGO
//
//  Created by Wizbu on 7.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "WeaponsViewController.h"
#import "SharedVariables.h"

@interface WeaponsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WeaponsViewController{
    SQLiteManager *dbmanager;
    NSArray *weapons;
}



- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = NO;
    [super viewDidLoad];
    self.title = @"Weapons";
    
    weapons = [NSArray new];
 
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM wepon_types "];

    [dbmanager openDatabase];
     weapons = [dbmanager getRowsForQuery:query];
    [dbmanager closeDatabase];
    
    
    NSLog(@"%@",weapons);
 
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return weapons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImage *myImage = [UIImage imageNamed:[weapons objectAtIndex:indexPath.row][@"w_type_image"]];

    // Configure the cell...
    cell.textLabel.text = [weapons objectAtIndex:indexPath.row][@"w_type_name"];
    cell.imageView.image = myImage;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [SharedVariables sharedObject].weaponTypeID = weapons[indexPath.row][@"w_type_id"];
    [SharedVariables sharedObject].weaponTypeName = weapons[indexPath.row][@"w_type_name"];

    
    if (indexPath.row == 0) {
        //sharedobject.selectdWeponType = 1
    }
    if (indexPath.row == 1) {
        // sahredobject.selected = 2
    }
    
}


@end
