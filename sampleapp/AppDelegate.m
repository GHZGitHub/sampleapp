//
//  AppDelegate.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import "AppDelegate.h"
#import "GHZNewsController.h"
#import "GHZVideoViewController.h"
#import "GHZReCommendViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarController = [UITabBarController new];
    
    //v1新闻
    UINavigationController *vc1 = [[UINavigationController alloc]initWithRootViewController:[GHZNewsController new]];
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.tabBarItem.title = @"新闻";
    vc1.tabBarItem.image = [UIImage systemImageNamed:@"message"];
    
    
    //v2视频
    GHZVideoViewController *vc2 = [GHZVideoViewController new];
    
   
    
    ///v3推荐
    GHZReCommendViewController *vc3 = [GHZReCommendViewController new];
 
    
    //v44
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage systemImageNamed:@"person.fill"];
    
    [tabBarController setViewControllers:@[vc1,vc2,vc3,vc4]];

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
