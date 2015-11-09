//
//  FansCell.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "FansCell.h"
#import "UIImageView+WebCache.h"
@implementation FansCell
{
    UIImageView *imageView1;
    
    UILabel *nameLabel;
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
    
    
    
  
    
    NSDictionary *dataDic = _cellData;
    NSString *url = dataDic[@"avatar"];
    [imageView1 sd_setImageWithURL:[NSURL URLWithString:url]];
    
    
    
    NSString *replyname = dataDic[@"userName"];
    nameLabel.text = replyname;
    
    
    
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
