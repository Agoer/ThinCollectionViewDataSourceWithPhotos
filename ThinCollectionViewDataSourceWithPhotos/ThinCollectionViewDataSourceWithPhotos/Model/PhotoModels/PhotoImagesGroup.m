//
//  PhotoImagesGroup.m
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoImagesGroup.h"

@implementation PhotoImagesGroup

- (id)initWithALAssetsGroup:(ALAssetsGroup *) group
{
    if (self = [super init]) {
        _group = group;
        
    }
    return self;
}


- (void)setGroup:(ALAssetsGroup *)group
{
    _group = group;

    _groupName = [group valueForProperty:@"ALAssetsGroupPropertyName"];
    _thumbImage = [UIImage imageWithCGImage:[group posterImage]];
    _assetsCount = [group numberOfAssets];
    
}

@end
