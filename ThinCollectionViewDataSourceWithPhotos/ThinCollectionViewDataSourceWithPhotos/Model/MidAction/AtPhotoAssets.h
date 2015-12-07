//
//  AtPhotoAssets.h
//  iAotumanLady
//
//  Created by chanli on 15/12/2.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AtPhotoAssets : NSObject

@property (strong,nonatomic) ALAsset *asset;
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
 *  获取是否是视频类型, Default = false
 */
@property (assign,nonatomic) BOOL isVideoType;
/**
 *  获取相册的URL
 */
- (NSURL *)assetURL;


@end
