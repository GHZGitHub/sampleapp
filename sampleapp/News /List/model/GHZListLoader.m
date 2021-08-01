//
//  GHZListLoader.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/29.
//

#import "GHZListLoader.h"

@implementation GHZListLoader
- (void)loadDataWithFinishBlock:(GHZListLoaderFinishBlcok)blcok{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    
    [manager GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSMutableArray *arr = @[].mutableCopy;
                       for (NSDictionary *dic in responseObject[@"result"][@"data"]) {
                           ListCellModel *model = [ListCellModel mj_objectWithKeyValues:dic];
                         [arr addObject:model];
                       }
                       self.listCellModelArr = arr;
           
                       dispatch_async(dispatch_get_main_queue(), ^{
                           if (blcok) {
                               blcok(YES,arr);
                           }
                       });
         
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];


}
@end
