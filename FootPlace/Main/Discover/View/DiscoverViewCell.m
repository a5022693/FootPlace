//
//  DiscoverViewCell.m
//  FootPlace
//
//  Created by wangchengyuan on 15/11/2.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DiscoverViewCell.h"

@implementation DiscoverViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _imageView.layer.masksToBounds = YES;
        
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}



@end
