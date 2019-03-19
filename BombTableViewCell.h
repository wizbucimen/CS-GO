//
//  BombTableViewCell.h
//  CSGO
//
//  Created by Wizbu on 21.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BombTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
