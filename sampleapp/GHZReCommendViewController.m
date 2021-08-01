//
//  GHZReCommendViewController.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import "GHZReCommendViewController.h"

@interface GHZReCommendViewController ()<UIScrollViewDelegate>

@end

@implementation GHZReCommendViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage systemImageNamed:@"heart.fill"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(kScreenWidth * 4, kScreenHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    NSArray * colorArr = @[[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],[UIColor blueColor]];
  
    for ( int i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        view.backgroundColor = colorArr[i];
        [scrollView addSubview:view];
    }
    [self.view addSubview:scrollView];
   
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scroll===contentpffsetX是%f",scrollView.contentOffset.x);
}                                              // any offset changes


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始拖拽");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"停止拖拽");
}



- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"降速");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"结束降速");
}
@end
