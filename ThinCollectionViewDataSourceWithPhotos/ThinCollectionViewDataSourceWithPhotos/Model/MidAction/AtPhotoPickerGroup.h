//
//  AtPhotoPickerGroup.h
//  iAotumanLady
//
//  Created by chanli on 15/12/2.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AtPhotoPickerGroup : NSObject

/**
 *  组名
 */
@property (nonatomic , copy) NSString *groupName;

/**
 *  缩略图
 */
@property (nonatomic , strong) UIImage *thumbImage;

/**
 *  组里面的图片个数
 */
@property (nonatomic , assign) NSInteger assetsCount;

/**
 *  类型 : Saved Photos...
 */
@property (nonatomic , copy) NSString *type;

/**
 *  该组是否有选中照片
 */
@property (nonatomic , assign) BOOL checked;

@property (nonatomic , strong) ALAssetsGroup *group;

@end
