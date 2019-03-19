//
//  MapsTwoViewController.m
//  CSGO
//
//  Created by Wizbu on 21.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "MapsTwoViewController.h"
#import "SQLiteManager.h"
#import "SharedVariables.h"
@interface MapsTwoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end
@implementation MapsTwoViewController{
    SQLiteManager *dbmanager;
    NSArray *mapArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    mapArray = [NSArray new];
    self.title = [SharedVariables sharedObject].mapName;
    
    dbmanager = [[SQLiteManager alloc] initWithDatabaseNamed:[[NSBundle mainBundle] pathForResource:@"csgodb" ofType:@"sqlite"]];
    NSString *query5 = [NSString stringWithFormat:@"SELECT * FROM maps WHERE rowid = %@",[SharedVariables sharedObject].mapID];
    
    NSLog(@"%@", query5);
    [dbmanager openDatabase];
    mapArray = [dbmanager getRowsForQuery:query5];
    [dbmanager closeDatabase];

    NSLog(@"Image = %@",mapArray);
    _imageView.image = [UIImage imageNamed:mapArray[0][@"m_images"]];
    _detailLabel.text = mapArray[0][@"m_detail"];

}


// BACK BUTONUNA BAK !!!

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mapArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{}

@end
