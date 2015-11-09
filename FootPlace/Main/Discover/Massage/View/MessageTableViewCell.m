//
//  MessageTableViewCell.m
//  FootPlace
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self _createSubViews];
        
        
    }
    return self;
}
-(void)_createSubViews
{
    _commentImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 45, 45)];
    _commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 23, 200, 20)];
    _commentImage.image = [UIImage imageNamed:@"msg_like"];
    _commentLabel.font = [UIFont boldSystemFontOfSize:16];
    _commentLabel.backgroundColor = [UIColor clearColor];
    _commentLabel.text = @"hello";
    [self.contentView addSubview:_commentImage];
    [self.contentView addSubview:_commentLabel];
}
@end
