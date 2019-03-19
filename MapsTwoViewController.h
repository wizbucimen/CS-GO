//
//  MapsTwoViewController.h
//  CSGO
//
//  Created by Wizbu on 21.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLiteManager.h"
#import "SharedVariables.h"
@interface MapsTwoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
