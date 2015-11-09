//
//  SelectionPostViewCell.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/26.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SelectionPostViewCell.h"

@implementation SelectionPostViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        //_imageView.contentMode=UIViewContentModeScaleAspectFill;
      // _imageView.contentMode = UIViewContentModeScaleToFill;
      //  _imageView.contentMode = UIViewContentModeCenter;
        
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
