//
//  UserCell.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/16.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayoutFrame.h"
#import "SquareLayoutFrame.h"


@interface UserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *loverCount;

@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UIImageView *commentCountImage;
@property (weak, nonatomic) IBOutlet UIImageView *loveCountImage;

//@property (nonatomic,strong)UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel1;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel2;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel3;

@property (weak, nonatomic) IBOutlet UIButton *loveBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@property (weak, nonatomic) IBOutlet UIButton *repalyBtn;


@property (nonatomic,strong)HomeLayoutFrame *Homelayout;
@property (nonatomic,strong)SquareLayoutFrame *Squarelayout;

@end
