//
//  ListCellModel.h
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCellModel : NSObject
@property(nonatomic,strong,readonly)NSString *author_name;
@property(nonatomic,strong,readonly)NSString *category;
@property(nonatomic,strong,readonly)NSString *date;
@property(nonatomic,assign,readonly)BOOL is_content;
@property(nonatomic,strong,readonly)NSString * thumbnail_pic_s;
@property(nonatomic,strong,readonly)NSString *title;
@property(nonatomic,strong,readonly)NSString *uniquekey;
@property(nonatomic,strong,readonly)NSString *url;


@end

NS_ASSUME_NONNULL_END
