//
//  GearViewController.h
//  CSGO
//
//  Created by Wizbu on 14.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLiteManager.h"
#import "SharedVariables.h"
@interface GearViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
