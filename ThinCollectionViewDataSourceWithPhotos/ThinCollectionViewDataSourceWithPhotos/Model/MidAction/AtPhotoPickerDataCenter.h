//
//  AtPhotoPickerDataCenter.h
//  iAotumanLady
//
//  Created by chanli on 15/12/2.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AtPhotoPickerGroup;

// 回调
typedef void(^groupCallBackBlock)(id obj);

@interface AtPhotoPickerDataCenter : NSObject

/**
 *  获取所有组
 */
+ (instancetype) defaultPicker;

/**
 * 获取所有组对应的图片
 */
- (void) getAllGroupWithPhotos : (groupCallBackBlock ) callBack;

/**
 * 获取所有组对应的Videos
 */
- (void) getAllGroupWithVideos : (groupCallBackBlock ) callBack;

/**
 *  传入一个组获取组里面的Asset
 */
- (void) getGroupPhotosWithGroup : (AtPhotoPickerGroup *) pickerGroup finished :(groupCallBackBlock ) callBack;

/**
 *  传入一个AssetsURL来获取UIImage
 */
- (void) getAssetsPhotoWithURLs:(NSURL *) url callBack:(groupCallBackBlock ) callBack;





@end
