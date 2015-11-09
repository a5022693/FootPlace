//
//  NOtificationCell.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "NOtificationCell.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"
@implementation NOtificationCell
{
    UIImageView *imageView1;
    
    UILabel *nameLabel;
    
    UILabel *huifuLabel;
    
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
    
   
    
    NSString *replyname = dataDic[@"sendUserName"];
    nameLabel.text = replyname;
    
    huifuLabel.text = @"关注了你";
    
    
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
