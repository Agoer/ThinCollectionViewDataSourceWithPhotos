//
//  PhotoAlbumsTableViewCell+ConfigureCell.m
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/7.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoAlbumsTableViewCell+ConfigureCell.h"
#import "PhotoImagesGroup.h"

@implementation PhotoAlbumsTableViewCell (ConfigureCell)

- (void)configureForPhoto:(PhotoImagesGroup *)photoImagesGroup
{
    self.imageView.image = photoImagesGroup.thumbImage;
    self.textLabel.text = photoImagesGroup.groupName;
}

@end
