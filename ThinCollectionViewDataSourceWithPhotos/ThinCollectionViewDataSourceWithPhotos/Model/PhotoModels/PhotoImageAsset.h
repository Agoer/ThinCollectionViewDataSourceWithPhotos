//
//  PhotoImageAsset.h
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoImageAsset : NSObject

/**
 *  图片原始文件
 */
@property (strong,nonatomic) ALAsset *asset;

/**
 *  获取是否是视频类型, Default = false
 */
@property (assign,nonatomic) BOOL isVideoType;

/**
 *  缩略图
 */
- (UIImage *)thumbImage;
/**
 *  压缩原图
 */
- (UIImage *)compressionImage;
/**
 *  原图
 */
- (UIImage *)originImage;
- (UIImage *)fullResolutionImage;

/**
 *  获取相册的URL
 */
- (NSURL *)assetURL;


@end
