//
//  SquareLayoutFrame.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SquareLayoutFrame.h"
#import "WXLabel.h"

@implementation SquareLayoutFrame
{

        
    NSString *_replayUName;
    NSString *_replayContext;
        
        

    
}

-(void)setSquareModel:(SquareModel *)squareModel{
    if (_squareModel != squareModel) {
        _squareModel = squareModel;
    }
    [self layoutFrameWithSquareModel:_squareModel];
    
}

-(void)layoutFrameWithSquareModel:(SquareModel *)model{
    
    self.frame = CGRectMake(0, 0, KScreenWidth, 0);
    
    
    //1.作者的图片
    
    CGFloat imageWidth = KScreenWidth;
    
    CGFloat imageHeight = [model.pictureHeight floatValue]/[model.pictureWidth floatValue] * imageWidth;
    
    self.pictureFrame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    
    //2.作者的内容
    
    CGFloat textWidth = CGRectGetWidth(self.frame)-20;
    
    NSString *text = model.contextText;
    
    CGFloat textHeight = [WXLabel getTextHeight:13 width:textWidth text:text linespace:5.0];
    self.contextFrame = CGRectMake(10, imageHeight+10, textWidth, textHeight);
    
    
    //赞和评论的数量
    
    _loveCountImageFrame = CGRectMake(10,CGRectGetMaxY(self.contextFrame)+5 , 12, 12);
    _loveCountFrame = CGRectMake(CGRectGetMaxX(self.loveCountImageFrame)+5,CGRectGetMaxY(self.contextFrame)+5 , 42, 12);
    _commentCountImageFrame = CGRectMake(CGRectGetMaxX(self.loveCountFrame)+5,CGRectGetMaxY(self.contextFrame)+5 , 12, 12);
    _commentCountFrame = CGRectMake(CGRectGetMaxX(self.commentCountImageFrame)+5,CGRectGetMaxY(self.contextFrame)+5 , 42, 12);
    
    
    //3.评论的内容
    
    
    CGFloat commentWidth = CGRectGetWidth(self.frame)-30;
    
    NSArray *commentList = model.commentList;
    
    _commentArray = [[NSMutableArray alloc]init];
    
    
    for (int i = 0;i<commentList.count;i++ ) {
        
        NSDictionary *commentText = commentList[i];
        
        _replayUName= commentText[@"replyUName"];
        _replayContext= commentText[@"text"];
        
        
        NSString *CommentContext = [NSString stringWithFormat:@"%@:%@",_replayUName,_replayContext];
        
        [_commentArray addObject:CommentContext];
        
    }
    if (1 <= commentList.count) {
        
        CGFloat commentHeight1 = [WXLabel getTextHeight:13 width:commentWidth text:_commentArray[0] linespace:5.0];
        
        
        self.commentFrame1 = CGRectMake(10,CGRectGetMaxY(self.contextFrame)+20, commentWidth, commentHeight1);
        
        
    }
    
    if (2 <= commentList.count) {
        
        CGFloat commentHeight2 = [WXLabel getTextHeight:13 width:commentWidth text:_commentArray[1] linespace:5.0];
        
        
        self.commentFrame2 = CGRectMake(10,CGRectGetMaxY(self.commentFrame1)+1, commentWidth, commentHeight2);
    }
    
    if (3 <= commentList.count) {
        
        CGFloat commentHeight3 = [WXLabel getTextHeight:13 width:commentWidth text:_commentArray[2] linespace:5.0];
        
        
        self.commentFrame3 = CGRectMake(10,CGRectGetMaxY(self.commentFrame2)+1, commentWidth, commentHeight3);
    }
    
    
    
    
    //计算微博视图的高度：微博视图最底部子视图的Y坐标
    CGRect f = self.frame;
    if (model.commentList.count == 3) {
        // NSLog(@"%@",commentList);
        
        f.size.height = CGRectGetMaxY(self.commentFrame3);
        
    }
    else if (model.commentList.count == 2){
        f.size.height = CGRectGetMaxY(self.commentFrame2);
        
    }
    else if (model.commentList.count == 1){
        f.size.height = CGRectGetMaxY(self.commentFrame1);
        
    }
    
    else if(text.length != 0) {
        f.size.height = CGRectGetMaxY(self.contextFrame);
    }
    else {
        f.size.height = CGRectGetMaxY(self.pictureFrame);
    }
    self.frame = f;
    
    
    _replayBtnFrame = CGRectMake(CGRectGetMaxX(self.frame)-40,CGRectGetMaxY(self.frame)+15, 20, 20);
    
    _commentBtnFrame =  CGRectMake(CGRectGetMaxX(self.replayBtnFrame)-70,CGRectGetMaxY(self.frame)+15, 20, 20);
    _loveBtnFrame =  CGRectMake(CGRectGetMaxX(self.commentBtnFrame)-70,CGRectGetMaxY(self.frame)+15, 20, 20);
    
    
    
    
    
}



@end
