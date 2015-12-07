//
//  PhotoAlbumsTableViewCell.h
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/7.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoAlbumsTableViewCell : UITableViewCell

@property (copy, nonatomic) NSString *photoAlbumsName;

@property (strong, nonatomic) UIImageView *photoAlbumsCoverUIImageView;

@end
