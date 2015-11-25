//
//  Datasource.h
//  search API
//
//  Created by 求攻略 on 15/11/25.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <UIKit/UIKit.h>

@interface Datasource : NSObject

@property (nonatomic,strong) NSArray *persons;

@property (nonatomic,strong) NSMutableArray *searchableItems;

- (void) savePeopleToIndex;

@end
