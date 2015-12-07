//
//  PhotoAlbumsTableViewCell+ConfigureCell.h
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/7.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoAlbumsTableViewCell.h"

@class PhotoImagesGroup;

@interface PhotoAlbumsTableViewCell (ConfigureCell)

- (void)configureForPhoto:(PhotoImagesGroup *)photoImagesGroup;

@end
