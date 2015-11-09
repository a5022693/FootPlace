//
//  CommentCell.m
//  FootPlace
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"
@implementation CommentCell
{
    UIImageView *imageView1;
    UIView *bgView;
    UILabel *nameLabel;
    UILabel *replyLabel;
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

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews
{
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    imageView1.layer.cornerRadius = 20;
    imageView1.layer.masksToBounds =YES;
    [self addSubview:imageView1];
    
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth-55, 15, 40, 40)];
    
    imageView2.layer.masksToBounds =YES;
    [self addSubview:imageView2];
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 200, 15)];
    nameLabel.textColor = [UIColor blackColor];
    [self addSubview:nameLabel];
    
    bgView =[[UIView alloc]initWithFrame:CGRectZero];
    bgView.layer.cornerRadius = 5;
    bgView.backgroundColor = [UIColor lightGrayColor];
    bgView.alpha = .5;
    [self addSubview:bgView];
    
    replyLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    replyLabel.textColor = [UIColor blackColor];
    [bgView addSubview:replyLabel];
    
    huifuLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, 200, 15)];
    huifuLabel.textColor = [UIColor blackColor];
    huifuLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:huifuLabel];
    
    NSDictionary *dataDic = _cellData;
    NSString *url = dataDic[@"sendAvatar"];
    [imageView1 sd_setImageWithURL:[NSURL URLWithString:url]];
    
    NSString *url1 = dataDic[@"resourceImg"];
    [imageView2 sd_setImageWithURL:[NSURL URLWithString:url1]];

    NSString *replyname = dataDic[@"sendUserName"];
    nameLabel.text = replyname;
    
    huifuLabel.text = @"回复 你";
    NSString *content = dataDic[@"messageText"];
    replyLabel.text = content;
    replyLabel.font =[UIFont systemFontOfSize:12];
    CGFloat textWidth =KScreenWidth-90;
    
    CGFloat textHeight = [WXLabel getTextHeight:13 width:textWidth text:content linespace:1.0];
    replyLabel.frame = CGRectMake(5, -20, textWidth+50, textHeight+50) ;
    bgView.frame = CGRectMake(15, 65, textWidth+50, textHeight+5);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
