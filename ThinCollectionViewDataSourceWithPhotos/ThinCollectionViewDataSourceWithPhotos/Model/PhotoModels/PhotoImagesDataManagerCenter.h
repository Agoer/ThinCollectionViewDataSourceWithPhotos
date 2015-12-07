//
//  PhotoImagesDataManagerCenter.h
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PhotoImagesGroup;

// 回调
typedef void(^groupCallBackBlock)(id obj);

@interface PhotoImagesDataManagerCenter : NSObject

/**
 *  获取所有组
 */
+ (instancetype) defaultPicker;


/**
 *  获取系统中所有的相册列表
 *
 *  @param callBlock 把得到的数据进行回调处理
 */
- (void)getAllGroupWithPhotos:(groupCallBackBlock)callBlock;

/**
 *  获取系统中所有的视频列表
 *
 *  @param callBlock 把得到的数据进行回调处理
 */
- (void)getAllGroupWithVideos:(groupCallBackBlock)callBlock;

/**
 *  根据 相册 model 获取 里面的 图片数组
 *
 *  @param photoImagesGroup 相册model
 *  @param callBack         数据回调
 */
- (void)getGroupPhotosWithGroup:(PhotoImagesGroup *)photoImagesGroup finished:(groupCallBackBlock )callBack;


/**
 *  传入一个AssetsURL来获取 PhotoImageAsset
 */
- (void) getPhotoImageAssetWithURLs:(NSURL *) url callBack:(groupCallBackBlock)callBack;


@end
