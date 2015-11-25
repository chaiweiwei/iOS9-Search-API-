//
//  Datasource.m
//  search API
//
//  Created by 求攻略 on 15/11/25.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "Datasource.h"
#import "Person.h"

@implementation Datasource

- (instancetype)init {
    if(self = [super init]) {
        Person *tom = [Person new];
        tom.name = @"tom";
        tom.userId = @"1";
        tom.imageName = @"arnaud_avatar";
        
        Person *pennay = [Person new];
        pennay.name = @"pennay";
        pennay.userId = @"2";
        pennay.imageName = @"lisa-1";
        
        Person *jammar = [Person new];
        jammar.name = @"jammar";
        jammar.userId = @"3";
        jammar.imageName = @"hires_1025456";
        
        Person *kitty = [Person new];
        kitty.name = @"kitty";
        kitty.userId = @"4";
        kitty.imageName = @"large_1025979";
        
        self.persons = @[tom,pennay,jammar,kitty];
    }
    return self;
}

- (NSMutableArray *)searchableItems {
    if(!_searchableItems) {
        _searchableItems = [NSMutableArray array];
    }
    return _searchableItems;
}

- (void)savePeopleToIndex {
    [self.persons enumerateObjectsUsingBlock:^(Person*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"image"];
        attributeSet.title = obj.name;
        attributeSet.contentDescription = @"this is search api";
        attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:obj.imageName]);
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:obj.userId
                                                                   domainIdentifier:@"test.chaiweiwei.search-API"
                                                                       attributeSet:attributeSet];
        [self.searchableItems addObject:item];
    }];
    
    CSSearchableIndex *searchableIndex = [CSSearchableIndex defaultSearchableIndex];
    [searchableIndex indexSearchableItems:self.searchableItems completionHandler:^(NSError * _Nullable error) {
        
        NSLog(@"%@",self.searchableItems);
    }];
}

@end
