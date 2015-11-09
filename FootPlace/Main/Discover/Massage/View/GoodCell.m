//
//  GoodCell.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "GoodCell.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"
@implementation GoodCell
{
    UIImageView *imageView1;
    
    UILabel *nameLabel;
    
    UILabel *huifuLabel;
    UIImageView *imageView2;
}
-(instancetype)init{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}
-(void)setCellData:(NSDictionary *)cellData
{
    if(_cellData != cellData)
    {
        _cellData = cellData;
    }
    
    [self layoutSubviews];
}
-(void)layoutSubviews
{
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    imageView1.layer.cornerRadius = 20;
    imageView1.layer.masksToBounds =YES;
    [self addSubview:imageView1];
    
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth-80, 15, 60, 60)];
    
    imageView2.layer.masksToBounds =YES;
    [self addSubview:imageView2];
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 200, 15)];
    nameLabel.textColor = [UIColor blackColor];
    [self addSubview:nameLabel];
    
   
    
    huifuLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, 200, 15)];
    huifuLabel.textColor = [UIColor blackColor];
    huifuLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:huifuLabel];
    
    NSDictionary *dataDic = _cellData;
    NSString *url = dataDic[@"sendAvatar"];
    [imageView1 sd_setImageWithURL:[NSURL URLWithString:url]];
    
    NSString *url1 = dataDic[@"resourceImg"];
    [imageView2 sd_setImageWithURL:[NSURL URLWithString:url1]];
    
    NSString *replyname = dataDic[@"replyUserName"];
    nameLabel.text = replyname;
    
    huifuLabel.text = @"赞了 你的帖子";
    
   
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
