//
//  GHZNewsCell.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import "GHZNewsCell.h"
@interface GHZNewsCell()
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *sourceLab;
@property(nonatomic,strong)UILabel *commentLab;
@property(nonatomic,strong)UILabel *timelab;
@property(nonatomic,strong)UIImageView *imgv;
@property(nonatomic,strong)UIButton *deleteBtn;
@end
@implementation GHZNewsCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //标题
        [self.contentView addSubview:({
                    self.titleLab = [[UILabel alloc]init];
                    self.titleLab.frame = CGRectMake(20, 15, 250, 50);
                    self.titleLab.font = [UIFont systemFontOfSize:16];
                    self.titleLab.textColor = [UIColor blackColor];
            self.titleLab.numberOfLines = 2;
            self.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
                   
            self.titleLab;
        })];

        //来源
        [self.contentView addSubview:({
                    self.sourceLab = [[UILabel alloc]init];
                    self.sourceLab.frame = CGRectMake(20, 80, 50, 20);
                    self.sourceLab.font = [UIFont systemFontOfSize:12];
                    self.sourceLab.textColor = [UIColor grayColor];
                  
            self.sourceLab;
        })];
        
        //评论
        [self.contentView addSubview:({
                    self.commentLab = [[UILabel alloc]init];
                    self.commentLab.frame = CGRectMake(100, 80, 50, 20);
                    self.commentLab.font = [UIFont systemFontOfSize:12];
                    self.commentLab.textColor = [UIColor grayColor];
                    
            self.commentLab;
        })];
        
        //时间
        
        [self.contentView addSubview:({
                    self.timelab = [[UILabel alloc]init];
                    self.timelab.frame = CGRectMake(180, 80, 50, 20);
                    self.timelab.font = [UIFont systemFontOfSize:12];
                    self.timelab.textColor = [UIColor grayColor];
            self.timelab;
        })];
        
        //图片
        [self.contentView addSubview:({
                    self.imgv = [[UIImageView alloc]init];
            self.imgv.frame = CGRectMake(300, 15, 100, 70);
            self.imgv.contentMode = UIViewContentModeScaleAspectFit;
            
            self.imgv;
        })];
        
        //删除按钮
//        [self.contentView addSubview:({
//            self.deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(260, 80, 30, 20)];
////            self.deleteBtn.backgroundColor = [UIColor redColor];
//            [self.deleteBtn setTitle:@"x" forState:UIControlStateNormal];
//            [self.deleteBtn setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteBtn addTarget:self action:@selector(deleteBtnClik) forControlEvents:UIControlEventTouchUpInside];
//        
//            self.deleteBtn.layer.cornerRadius = 10;
//            self.deleteBtn.layer.masksToBounds = YES;
//            self.deleteBtn.layer.borderWidth = 2;
//            self.deleteBtn.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
//            self.deleteBtn;
//        })];
//    }
    }
        return self;
        
}

- (void)layoutCellWithModel:(ListCellModel *)model{
    self.titleLab.text = model.title;
    
    self.sourceLab.text = model.author_name;
    [self.sourceLab sizeToFit];
    
    self.commentLab.text = model.category;
    [self.commentLab sizeToFit];
    self.commentLab.frame = CGRectMake(self.sourceLab.frame.origin.x + self.sourceLab.frame.size.width + 15,self.commentLab.frame.origin.y , self.commentLab.frame.size.width, self.commentLab.frame.size.height);
    
    
    self.timelab.text  = model.date;
    [self.timelab sizeToFit];
    self.timelab.frame = CGRectMake(self.commentLab.frame.origin.x + self.commentLab.frame.size.width + 15, self.timelab.frame.origin.y , self.timelab.frame.size.width, self.timelab.frame.size.height);
    
    self.imgv.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
    
   
    
}

////删除按钮
//- (void)deleteBtnClik{
//
//}

@end
