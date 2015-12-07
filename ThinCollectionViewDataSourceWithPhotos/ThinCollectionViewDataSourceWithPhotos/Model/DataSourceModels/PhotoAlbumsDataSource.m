//
//  PhotoAlbumsDataSource.me
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoAlbumsDataSource.h"

@interface PhotoAlbumsDataSource ()

@property (strong, nonatomic) NSArray *items;

@property (copy, nonatomic) NSString *cellIndentifier;

@property (copy, nonatomic) TableViewCellConfigureBlock configureBlock;

@end

@implementation PhotoAlbumsDataSource

- (id)init
{
    return nil;
}


- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    
    if (self) {
        self.items = anItems;
        self.cellIndentifier = aCellIdentifier;
        self.configureBlock = [aConfigureCellBlock copy];
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}

#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIndentifier forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.configureBlock(cell,item);
    
    return cell;
    
}


@end
