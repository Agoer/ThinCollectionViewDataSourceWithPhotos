//
//  PhotoAlbumsDataSource.h
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface PhotoAlbumsDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;




@end
