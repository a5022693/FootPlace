//
//  DetailsLayoutFrame.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/28.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DetailsLayoutFrame.h"
#import "WXLabel.h"

@implementation DetailsLayoutFrame



-(void)setModel:(DetailsModel *)model{
    if (_model != model) {
        _model = model;
        
        [self layoutFrameWithDetailsModel:_model];

    }
    
    
}

-(void)layoutFrameWithDetailsModel:(DetailsModel *)model{
    
    
    //图片
    CGFloat imageWidth = KScreenWidth;
    
    CGFloat imageHeight = [model.imgHeight floatValue]/[model.imgWidth floatValue] *imageWidth;
    
    _imageViewFrame = CGRectMake(0, 60,imageWidth , imageHeight);
    
    
    CGFloat contextLabelWidth = KScreenWidth;
    
    NSString *context = model.text;
    
    CGFloat contextLabelHeight = [WXLabel getTextHeight:13 width:contextLabelWidth text:context linespace:5.0];
    
    _contextFrame = CGRectMake(10, CGRectGetMaxY(self.imageViewFrame)+5,contextLabelWidth, contextLabelHeight);
    
    _addressFrame = CGRectMake(0, CGRectGetMaxY(self.contextFrame)+5, KScreenWidth, 20);
    
    
    _likesFrame = CGRectMake(0,CGRectGetMaxY(self.addressFrame)+5 , KScreenWidth, 50);
    
    
    
    
}
@end
