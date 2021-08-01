//
//  GHZListLoader.h
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/29.
//

#import <Foundation/Foundation.h>
#import "ListCellModel.h"
typedef  void(^GHZListLoaderFinishBlcok) (BOOL isSuccess,NSArray<ListCellModel *> * _Nullable  dataarry);
NS_ASSUME_NONNULL_BEGIN

@interface GHZListLoader : NSObject
//列表cell模型数组
@property(nonatomic,strong,readwrite)NSArray *listCellModelArr;
- (void)loadDataWithFinishBlock:(GHZListLoaderFinishBlcok)blcok;

@end

NS_ASSUME_NONNULL_END
