//
//  SharedVariables.h
//  NoteApp
//
//  Created by Wizbu on 2.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedVariables : NSObject

@property (nonatomic, strong) NSString *weaponTypeID;
@property (nonatomic, strong) NSString *weaponTypeName;
@property (nonatomic, strong) NSString *weaponRowID;
@property (nonatomic, strong) NSString *weponName;


@property (nonatomic, strong) NSString *bombsTypesID;
@property (nonatomic, strong) NSString *bombsTypesName;
@property (nonatomic, strong) NSString *gearID;
@property (nonatomic, strong) NSString *gearName;

@property (nonatomic, strong) NSString *mapsTypesID;
@property (nonatomic, strong) NSString *mapCategoryName;

@property (nonatomic, strong) NSString *mapName;

@property (nonatomic, strong) NSString *mapID;
@property (nonatomic, strong) NSString *mapDetails;




//@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *content;


+(SharedVariables *)sharedObject;

@end
