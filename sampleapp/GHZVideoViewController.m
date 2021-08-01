//
//  GHZVideoViewController.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import "GHZVideoViewController.h"

@interface GHZVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GHZVideoViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage systemImageNamed:@"video.fill"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 16;
    flowLayout.minimumLineSpacing = 16;
//    flowLayout.itemSize = CGSizeMake((kScreenWidth - 16) / 2, 200);
    
    //
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    //注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    //数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.view addSubview:collectionView];
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  20;;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return  cell ;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item % 5 == 0) {
        return CGSizeMake(kScreenWidth, 100);
    }else{
        return  CGSizeMake((kScreenWidth - 16) / 2, 200);
    }
}
@end
