//
//  DetailsCell.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/29.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DetailsCell.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"

@implementation DetailsCell
{
    
    UIImageView *imageView;
    
    UILabel *replyUName;
    
    UILabel *replyText;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
      
    }
    
    return self;
}
-(void)setCellData:(NSDictionary *)cellData{
    if (_cellData != cellData) {
        _cellData = cellData;
    }
    
    [self setNeedsLayout];
}

-(void)creatSubViews{
   
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    imageView.layer.cornerRadius = 20;
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];

    replyUName = [[UILabel alloc ]initWithFrame:CGRectMake(70,20 , 200, 15)];
    replyUName.font = [UIFont systemFontOfSize:14];
    [self addSubview:replyUName];
    
    replyText = [[UILabel alloc]initWithFrame:CGRectZero];
    replyText.textColor = [UIColor lightGrayColor];
    replyText.numberOfLines = 0;
    [self addSubview:replyText];
    
    
}
-(void)layoutSubviews{
    [self creatSubViews];

    [super layoutSubviews];
    NSDictionary *dataDic = _cellData;
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:dataDic[@"replyUAvatar"]]];
    
    replyUName.text = dataDic[@"replyUName"];
    
    
    NSString *repliedUName = dataDic[@"repliedUName"];
    
    
    
    if (repliedUName.length != 0) {
        
        replyUName.text = [replyUName.text stringByAppendingFormat:@"  回复  %@",repliedUName];
        
        NSMutableAttributedString *MutableStr = [[NSMutableAttributedString alloc]initWithString:replyUName.text];
        [MutableStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[replyUName.text rangeOfString:@"回复"]];
        
        replyUName.attributedText = MutableStr;
    }
    
   
    
    NSString *text = dataDic[@"text"];
    
    CGFloat textWidth =KScreenWidth-90;
    
    CGFloat textHeight = [WXLabel getTextHeight:14 width:textWidth text:text linespace:5.0];
    replyText.frame = CGRectMake(70, CGRectGetMaxY(replyUName.frame) + 20, textWidth, textHeight);
    replyText.text = text;
    
    
    

    
    
    
    
    
    
    
    
}
@end
