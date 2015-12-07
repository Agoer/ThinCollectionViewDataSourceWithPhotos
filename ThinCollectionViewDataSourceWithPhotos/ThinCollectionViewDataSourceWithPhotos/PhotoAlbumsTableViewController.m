//
//  CollectionViewController.m
//  ThinCollectionViewDataSourceWithPhotos
//
//  Created by chanli on 15/12/4.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "PhotoAlbumsTableViewController.h"
#import "PhotoImagesDataManagerCenter.h"
#import "PhotoAlbumsDataSource.h"
#import "PhotoAlbumsTableViewCell.h"
#import "PhotoImagesGroup.h"
#import "PhotoAlbumsTableViewCell+ConfigureCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AtPhotoPickerDataCenter.h"
#import "AtPhotoPickerGroup.h"

static NSString *PICKER_PowerBrowserPhotoLibirayText = @"您屏蔽了选择相册的权限，开启请去系统设置->隐私->我的App来打开权限";


#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface PhotoAlbumsTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *photoAlbumsTableView;

@property (strong, nonatomic) PhotoAlbumsDataSource *photoAlbumsDataSource;

@property (strong, nonatomic)AtPhotoPickerGroup *assetsGroup;
@property (strong, nonatomic)NSArray *photoAlbumsArray;

@end

@implementation PhotoAlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.photoAlbumsTableView = ({
    
        UITableView *photoAlbumsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStylePlain];
        photoAlbumsTableView.delegate = self;
        [photoAlbumsTableView registerClass:[PhotoAlbumsTableViewCell class] forCellReuseIdentifier:PhotoCellIdentifier];
        [self.view addSubview:photoAlbumsTableView];
        photoAlbumsTableView;
    });
    
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
        // 判断没有权限获取用户相册的话，就提示个View
        UIImageView *lockView = [[UIImageView alloc] init];
        lockView.image = [UIImage imageNamed:@"lock.png"];
        lockView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
        lockView.contentMode = UIViewContentModeCenter;
        [self.view addSubview:lockView];
        
        UILabel *lockLbl = [[UILabel alloc] init];
        lockLbl.text = PICKER_PowerBrowserPhotoLibirayText;
        lockLbl.numberOfLines = 0;
        lockLbl.textAlignment = NSTextAlignmentCenter;
        lockLbl.frame = CGRectMake(20, 0, self.view.frame.size.width - 40, self.view.frame.size.height);
        [self.view addSubview:lockLbl];
        
    } else {
        
        
        
    [self setupTableView];
    
    }
    // Do any additional setup after loading the view.
}

- (void)reloadImagesArrayAndReloadData
{
    AtPhotoPickerDataCenter *datas = [AtPhotoPickerDataCenter defaultPicker];
    __weak typeof(self) weakSelf = self;
    
    // 获取所有的图片URLs
    [datas getAllGroupWithPhotos:^(NSArray *groups) {
        self.photoAlbumsArray = [[groups reverseObjectEnumerator] allObjects];
        
        weakSelf.photoAlbumsTableView.dataSource = self;
        [weakSelf.photoAlbumsTableView reloadData];
        
        _assetsGroup = [groups lastObject];
//        [self setupAssets];
        
    }];
}


- (void)setupTableView
{
    
    PhotoImagesDataManagerCenter *photoImagesDataManagerCenter = [PhotoImagesDataManagerCenter defaultPicker];
    __weak typeof(self) weakSelf = self;
    
    [photoImagesDataManagerCenter getAllGroupWithPhotos:^(NSArray *groups) {
        
        
        TableViewCellConfigureBlock configureCell = ^(PhotoAlbumsTableViewCell *cell,PhotoImagesGroup *photoImagesGroup) {
            
            [cell configureForPhoto:photoImagesGroup];
            
        };
        
        weakSelf.photoAlbumsDataSource = [[PhotoAlbumsDataSource alloc]initWithItems:groups cellIdentifier:PhotoCellIdentifier configureCellBlock:configureCell];
        
        weakSelf.photoAlbumsTableView.dataSource = weakSelf.photoAlbumsDataSource;
        
        [weakSelf.photoAlbumsTableView reloadData];
        
    }];

}

#pragma mark- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
