//
//  SelectionPostView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/23.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SelectionPostView.h"
#import "SelectionPostViewCell.h"
#import "UIImageView+WebCache.h"
#import "PullToDetailsController.h"
#import "UIView+UIViewController.h"


@implementation SelectionPostView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout] ;
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator  = NO;
        
        [self registerClass:[SelectionPostViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
    }
    
    return self;
    
 }
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _squareselectionPostArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectionPostViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    _model = _squareselectionPostArray[indexPath.row];
    
    NSString *imageName =  _model.postImg;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _model = _squareselectionPostArray[indexPath.row];

    
    [PullToDetailsController pullToDetailsControllerWithController:self.viewController AndPostId:_model.postId];
    
    
    
    
}


@end
