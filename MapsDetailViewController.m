//
//  MapsDetailViewController.m
//  CSGO
//
//  Created by Wizbu on 14.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "MapsDetailViewController.h"
#import "SharedVariables.h"
@interface MapsDetailViewController ()

@end

@implementation MapsDetailViewController{

SQLiteManager *dbmanager;
NSArray *mapsDetail;
}
- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = NO;
    self.title = [SharedVariables sharedObject].mapCategoryName ;
    [super viewDidLoad];
    mapsDetail = [NSArray new];
    
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query4 = [NSString stringWithFormat:@"SELECT rowid,* FROM maps WHERE map_type_id = %@",[SharedVariables sharedObject].mapsTypesID];
    
    NSLog(@"%@", query4);
    [dbmanager openDatabase];
    mapsDetail = [dbmanager getRowsForQuery:query4];
    [dbmanager closeDatabase];
    
    //tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    NSLog(@"KAÇA BASTIN?!?!?! %@",mapsDetail);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mapsDetail.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [mapsDetail objectAtIndex:indexPath.row][@"m_name"];
    cell.imageView.image = [UIImage imageNamed:[mapsDetail objectAtIndex:indexPath.row][@"m_images"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   [SharedVariables sharedObject].mapID = mapsDetail[indexPath.row][@"rowid"];
   [SharedVariables sharedObject].mapName = mapsDetail[indexPath.row][@"m_name"];

//    [SharedVariables sharedObject].mapName = mapsDetail[indexPath.row][@"m_name"];

}

    @end
