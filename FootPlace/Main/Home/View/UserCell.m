//
//  UserCell.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/16.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "UserCell.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"


@implementation UserCell
{
    NSArray *_commentArray;
    
}
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    
//     self = [super initWithCoder:aDecoder];
//    
//    if (self) {
//
//    }
//    
//    return self;
//}

- (void)awakeFromNib {
   
    
    
}



-(void)setHomelayout:(HomeLayoutFrame *)Homelayout{
    if (_Homelayout != Homelayout) {
        _Homelayout = Homelayout;
    }
    
    [self setNeedsLayout];
    
}
-(void)setSquarelayout:(SquareLayoutFrame *)Squarelayout{
    if (_Squarelayout != Squarelayout) {
        _Squarelayout = Squarelayout;
        
    }
    [self setNeedsLayout];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    if (_Homelayout !=  nil) {
        
        //作者的图片
        _pictureImage.frame = _Homelayout.pictureFrame;
        
        _pictureImage.contentMode = UIViewContentModeScaleAspectFit;
        
        _pictureImage.backgroundColor = [UIColor colorWithRed:239/255 green:239/255 blue:239/255 alpha:239/255];
        _pictureImage.image = [UIImage imageNamed:@"fp_bg.9.png"];
        
        
        //
        NSString *UrlStr = _Homelayout.userModel.pictureImageUrl;
        NSURL *url = [NSURL URLWithString:UrlStr];
        //    NSData *data = [NSData dataWithContentsOfURL:url];
        //    _pictureImage.image = [UIImage imageWithData:data];
        
        [_pictureImage sd_setImageWithURL:url];
        
        
        
        
        
        
        //作者的内容
        _authorLabel.frame = _Homelayout.contextFrame;
        _authorLabel.font = [UIFont systemFontOfSize:13];
        _authorLabel.text = _Homelayout.userModel.contextText;
        _authorLabel.numberOfLines = 0;
        
        
        //赞和评论的数量
        _loveCountImage.frame = _Homelayout.loveCountImageFrame;
        _loverCount.frame = _Homelayout.loveCountFrame;
        _loverCount.text = _Homelayout.userModel.loverCount;
        
        _commentCountImage.frame = _Homelayout.commentCountImageFrame;
        _commentCount.frame = _Homelayout.commentCountFrame;
        _commentCount.text = _Homelayout.userModel.commentCount;
        
        
        
        
        //评论的内容
        //_commentArray = _layout.commentArray;
        
        if (1 <=_Homelayout.userModel.commentList.count) {
            NSMutableAttributedString *mutableStr1 = [self changeTextFoarmatWithDictionary:_Homelayout.userModel.commentList[0]];
            
            _commentLabel1.attributedText = mutableStr1;
            _commentLabel1.frame = _Homelayout.commentFrame1;
            _commentLabel1.numberOfLines = 0;
            
            
        }
        if (2 <=_Homelayout.userModel.commentList.count) {
            NSMutableAttributedString *mutableStr2 = [self changeTextFoarmatWithDictionary:_Homelayout.userModel.commentList[1]];
            
            _commentLabel2.attributedText = mutableStr2;
            _commentLabel2.frame = _Homelayout.commentFrame2;
            _commentLabel2.numberOfLines = 0;
            
        }
        if (3<= _Homelayout.userModel.commentList.count) {
            
            NSMutableAttributedString *mutableStr3 = [self changeTextFoarmatWithDictionary:_Homelayout.userModel.commentList[2]];
            
            _commentLabel3.attributedText = mutableStr3;
            _commentLabel3.frame = _Homelayout.commentFrame3;
            _commentLabel3.numberOfLines = 0;
            
        }    
        _loveBtn.frame = _Homelayout.loveBtnFrame;
        _commentBtn.frame = _Homelayout.commentBtnFrame;
        _repalyBtn.frame = _Homelayout.replayBtnFrame;
        
    }
    else if (_Squarelayout != nil){
        _pictureImage.frame = _Squarelayout.pictureFrame;
        
        _pictureImage.contentMode = UIViewContentModeScaleAspectFit;
        
        _pictureImage.backgroundColor = [UIColor colorWithRed:239/255 green:239/255 blue:239/255 alpha:239/255];
        _pictureImage.image = [UIImage imageNamed:@"fp_bg.9.png"];
        
        
        //
        NSString *UrlStr = _Squarelayout.squareModel.pictureImageUrl;
        NSURL *url = [NSURL URLWithString:UrlStr];
        //    NSData *data = [NSData dataWithContentsOfURL:url];
        //    _pictureImage.image = [UIImage imageWithData:data];
        
        [_pictureImage sd_setImageWithURL:url];
        
        
        
        
        
        
        //作者的内容
        _authorLabel.frame = _Squarelayout.contextFrame;
        _authorLabel.font = [UIFont systemFontOfSize:13];
        _authorLabel.text = _Squarelayout.squareModel.contextText;
        _authorLabel.numberOfLines = 0;
        
        
        //赞和评论的数量
        _loveCountImage.frame = _Squarelayout.loveCountImageFrame;
        _loverCount.frame = _Squarelayout.loveCountFrame;
        _loverCount.text = _Squarelayout.squareModel.loverCount;
        
        _commentCountImage.frame = _Squarelayout.commentCountImageFrame;
        _commentCount.frame = _Squarelayout.commentCountFrame;
        _commentCount.text = _Squarelayout.squareModel.commentCount;
        
        
        
        
        //评论的内容
        //_commentArray = _layout.commentArray;
        
        if (1 <=_Squarelayout.squareModel.commentList.count) {
            NSMutableAttributedString *mutableStr1 = [self changeTextFoarmatWithDictionary:_Squarelayout.squareModel.commentList[0]];
            
            _commentLabel1.attributedText = mutableStr1;
            _commentLabel1.frame = _Squarelayout.commentFrame1;
            _commentLabel1.numberOfLines = 0;
            
            
        }
        if (2 <=_Squarelayout.squareModel.commentList.count) {
            NSMutableAttributedString *mutableStr2 = [self changeTextFoarmatWithDictionary:_Squarelayout.squareModel.commentList[1]];
            
            _commentLabel2.attributedText = mutableStr2;
            _commentLabel2.frame = _Squarelayout.commentFrame2;
            _commentLabel2.numberOfLines = 0;
            
        }
        if (3<= _Squarelayout.squareModel.commentList.count) {
            
            NSMutableAttributedString *mutableStr3 = [self changeTextFoarmatWithDictionary:_Squarelayout.squareModel.commentList[2]];
            
            _commentLabel3.attributedText = mutableStr3;
            _commentLabel3.frame = _Squarelayout.commentFrame3;
            _commentLabel3.numberOfLines = 0;
            
        }
        _loveBtn.frame = _Squarelayout.loveBtnFrame;
        _commentBtn.frame = _Squarelayout.commentBtnFrame;
        _repalyBtn.frame = _Squarelayout.replayBtnFrame;
        
        
        
        
    }
    
    
}

   //  改变字体格式
-(NSMutableAttributedString *)changeTextFoarmatWithDictionary:(NSDictionary *)commentDic{
    NSString *replayUName= commentDic[@"replyUName"];
    NSString *replayContext= commentDic[@"text"];
    
    NSString *CommentText = [NSString stringWithFormat:@"%@:%@",replayUName,replayContext];
    
    NSMutableAttributedString *MutableStr = [[NSMutableAttributedString alloc]initWithString:CommentText];
    [MutableStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:[CommentText rangeOfString:replayUName]];
        
    [MutableStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:[CommentText rangeOfString:replayUName]];
        
    [MutableStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:[CommentText rangeOfString:replayContext]];
    [MutableStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[CommentText rangeOfString:replayContext]];
        
        
        
        
        return  MutableStr;
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
