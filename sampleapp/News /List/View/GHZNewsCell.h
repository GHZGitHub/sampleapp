//
//  GHZNewsCell.h
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import <UIKit/UIKit.h>
#import "ListCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHZNewsCell : UITableViewCell
- (void)layoutCellWithModel:(ListCellModel *)model;
@end

NS_ASSUME_NONNULL_END
