//
//  WeaponsDetailViewController.m
//  CSGO
//
//  Created by Wizbu on 9.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "WeaponsDetailViewController.h"
#import "SQLiteManager.h"
#import "SharedVariables.h"

@interface WeaponsDetailViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
@property (weak, nonatomic) IBOutlet UILabel *killRewardLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UILabel *magazineSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *reloadTimesLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobilityLabel;
@property (weak, nonatomic) IBOutlet UILabel *reloadReadyLabel;

@property (weak, nonatomic) IBOutlet UIView *detailView;
@end

@implementation WeaponsDetailViewController
SQLiteManager *dbmanager;
NSArray *weapon;
NSArray *imageArray;


- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = NO;
    [super viewDidLoad];

    weapon= [NSArray new];
    imageArray= [NSArray new];
    

    
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM weapons WHERE rowid = %@",[SharedVariables sharedObject].weaponRowID];
    [dbmanager openDatabase];
    weapon = [dbmanager getRowsForQuery:query];
    [dbmanager closeDatabase];
    NSLog(@"Result = %@",weapon);
    
    self.title = weapon[0][@"Wepon_name"];

    _priceLabel.text = weapon[0][@"Price"];
    _killRewardLabel.text = weapon[0][@"Kill Award"];
    _damageLabel.text =  [NSString stringWithFormat:@"%@ / %@",weapon[0][@"Damage"],weapon[0][@"Armored Damage"]];
    _reloadReadyLabel.text = weapon[0][@"Reload_Fire_Ready"];
    _mobilityLabel.text = weapon[0][@"Mobility"];
    _magazineSizeLabel.text = [NSString stringWithFormat:@"%@ / %@",weapon[0][@"MagazineSize"],weapon[0][@"Ammo inReserve"]];
    _reloadTimesLabel.text = weapon[0][@"Reload_Clip_Ready"];


    NSString *query2= [NSString stringWithFormat:@"SELECT w_images FROM wepon_images WHERE rowid = %@",[SharedVariables sharedObject].weaponRowID];
    [dbmanager openDatabase];
    imageArray = [dbmanager getRowsForQuery:query2];
    [dbmanager closeDatabase];
    NSLog(@"Image = %@",imageArray);
    
    _imageView.image = [UIImage imageNamed:imageArray[0][@"w_images"]];
    




    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}



//[SharedVariables sharedObject].weaponRowID = [weapons objectAtIndex:indexPath.row][@"rowid"];}

- (IBAction)switchAction:(id)sender {
    
    _detailView.hidden = !_mySwitch.isOn;

//    if (_mySwitch.isOn) {
//        _detailView.hidden = NO;
//    }
//    else {
//        _detailView.hidden = YES;
//
//    }
}

@end
