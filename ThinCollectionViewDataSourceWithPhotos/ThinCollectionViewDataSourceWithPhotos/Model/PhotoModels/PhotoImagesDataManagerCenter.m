//
//  PhotoImagesDataManagerCenter.m
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoImagesDataManagerCenter.h"
#import "PhotoImagesGroup.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoImagesDataManagerCenter ()

@property (nonatomic , strong) ALAssetsLibrary *library;

@end

@implementation PhotoImagesDataManagerCenter

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,^
                  {
                      library = [[ALAssetsLibrary alloc] init];
                  });
    return library;
}

- (ALAssetsLibrary *)library
{
    if (nil == _library)
    {
        _library = [self.class defaultAssetsLibrary];
    }
    
    return _library;
}

#pragma mark - getter
+ (instancetype) defaultPicker{
    return [[self alloc] init];
}


- (void)getAllGroupWithPhotos:(groupCallBackBlock)callBlock
{
    [self getAllGroupAllPhotos:YES withResource:callBlock];
}


- (void)getAllGroupWithVideos:(groupCallBackBlock)callBlock
{
    [self getAllGroupAllPhotos:NO withResource:callBlock];
}


/**
 *  区分 照片 还是 视频
 *
 *  @param allPhotos YES：照片，or 视频
 *  @param callblock 把得到的数据进行回调处理
 */
- (void)getAllGroupAllPhotos:(BOOL)allPhotos withResource:(groupCallBackBlock)callblock
{
    NSMutableArray *groups = [NSMutableArray array];
    
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *group, BOOL *stop){
      
        if (group) {
            [group setAssetsFilter:allPhotos?[ALAssetsFilter allPhotos]:[ALAssetsFilter allVideos]];
            
            PhotoImagesGroup *photoImagesGroup = [[PhotoImagesGroup alloc]init];
            
            photoImagesGroup.groupName = [group valueForProperty:@"ALAssetsGroupPropertyName"];
            photoImagesGroup.thumbImage = [UIImage imageWithCGImage:[group posterImage]];
            photoImagesGroup.assetsCount = [group numberOfAssets];

            
            [groups addObject:photoImagesGroup];
        } else {
            callblock(groups);
        }
    };

    NSInteger type = ALAssetsGroupAll;
    
    [self.library enumerateGroupsWithTypes:type usingBlock:resultBlock failureBlock:nil];
    
}


- (void)getGroupPhotosWithGroup:(PhotoImagesGroup *)photoImagesGroup finished:(groupCallBackBlock )callBack
{
    NSMutableArray *imageAssetsArray = [NSMutableArray array];
    
    ALAssetsGroupEnumerationResultsBlock result = ^(ALAsset *asset, NSUInteger index, BOOL *stop){
      
        if (asset) {
            [imageAssetsArray addObject:asset];
        } else {
            callBack(imageAssetsArray);
        }
        
    };
    
    [photoImagesGroup.group enumerateAssetsUsingBlock:result];
    
}

- (void) getPhotoImageAssetWithURLs:(NSURL *) url callBack:(groupCallBackBlock )callBack
{
    {
        [self.library assetForURL:url resultBlock:^(ALAsset *asset) {
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack([UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]);
            });
        } failureBlock:nil];
    }
}

@end
