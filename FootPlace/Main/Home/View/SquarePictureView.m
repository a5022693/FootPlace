//
//  SquarePictureView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/22.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SquarePictureView.h"
#import "UIImageView+WebCache.h"
#import "SelectionPostView.h"
#import "SelectionPostViewLayout.h"
#import "PullToDetailsController.h"
#import "UIView+UIViewController.h"
#import "WebViewController.h"

@interface SquarePictureView ()

@property(nonatomic,strong)UITapGestureRecognizer *headTap;
@property(nonatomic,strong)UITapGestureRecognizer *nearTap;
@property(nonatomic,strong)UITapGestureRecognizer *hotPostTap;
@property(nonatomic,strong)UITapGestureRecognizer *hotAlbumTap;
@property(nonatomic,strong)UITapGestureRecognizer *userNewTap;
@property(nonatomic,strong)UITapGestureRecognizer *postNewTap;
@property(nonatomic,strong)UITapGestureRecognizer *tagsTap;




@end

@implementation SquarePictureView
{
    
    UIScrollView *_baseScrollView;
    UIScrollView *headView;
    UIPageControl *_pageControl;
    UIScrollView *_nearbyScrollView;
    UIScrollView *_hotPostScrollView;
    UIScrollView *_hotAlbumScrollView;//热门影集
    
    SelectionPostView *_selectionPostView;
    
    
    UIButton *_newUserBtn;
    UIScrollView *_newUserScrollView;
    
    UIButton *_newPostBtn;
    UIScrollView *_newPostScrollView;
    
    UIButton *_tagsBtn;
    UIScrollView *_tagsScrollView;
    
    
    UIView *_secondView;
    
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        [self creatFirstSubviews];
        [self creatSecondSubviews];
        //[self _loadData];
    }
    return self;
    
    
}

-(void)setTotalData:(SquarePicTotalData *)totalData{
    
    if (_totalData != totalData) {
        _totalData = totalData;
        [self _loadData];
    }
    
}

-(void)creatFirstSubviews{
    
    _baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,KScreenWidth, KScreenHeigth-49-40)];
    _baseScrollView.contentSize = CGSizeMake(KScreenWidth,KScreenWidth*1.2+200);
    _baseScrollView.backgroundColor = [UIColor whiteColor];
    _baseScrollView.alwaysBounceVertical = YES;
    _baseScrollView.showsVerticalScrollIndicator = NO;
    _baseScrollView.bounces = NO;
    [self addSubview:_baseScrollView];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth ,140)];
    [_baseScrollView addSubview:view];
    
    headView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,140)];
   
    headView.backgroundColor = [UIColor whiteColor];
    headView.pagingEnabled = YES;
    headView.delegate = self;
    headView.bounces = NO;
    headView.showsHorizontalScrollIndicator = NO;
    
    
    
    [view addSubview:headView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,headView.bounds.size.height-20, KScreenWidth, 10)];
    
    
    _pageControl.currentPage = 0;
    
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:(104/255.0) green:(104/255.0) blue:(104/255.0) alpha:0.5];
    [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:_pageControl];
    
    
    _nearbyScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 140, KScreenWidth, KScreenWidth * 0.4)];
    _nearbyScrollView.backgroundColor = [UIColor whiteColor];
    _nearbyScrollView.bounces = NO;
    _nearbyScrollView.delegate = self;
    _nearbyScrollView.showsHorizontalScrollIndicator = NO;
    
    [_baseScrollView addSubview:_nearbyScrollView];
   
    
    
    
    _hotPostScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_nearbyScrollView.frame), KScreenWidth, KScreenWidth * 0.4)];
    _hotPostScrollView.backgroundColor = [UIColor whiteColor];
    _hotPostScrollView.bounces = NO;
    _hotPostScrollView.delegate = self;
    _hotPostScrollView.showsHorizontalScrollIndicator = NO;
    
    [_baseScrollView addSubview:_hotPostScrollView];
    
    
    _hotAlbumScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_hotPostScrollView.frame), KScreenWidth,  KScreenWidth * 0.4)];
    _hotAlbumScrollView.backgroundColor =[UIColor whiteColor];
    _hotAlbumScrollView.bounces = NO;
    _hotAlbumScrollView.delegate = self;
    _hotAlbumScrollView.showsHorizontalScrollIndicator = NO;
    
    [_baseScrollView addSubview:_hotAlbumScrollView];
    
    
}

-(void)creatSecondSubviews{
    
    
    _secondView = [[UIView alloc]initWithFrame:CGRectMake(0,KScreenHeigth-49-64-40,KScreenWidth, KScreenHeigth)];
    _secondView.backgroundColor =[UIColor whiteColor];
    
    [self addSubview:_secondView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,KScreenWidth, 30)];
    [button setBackgroundColor:[UIColor colorWithRed:(55/255.0) green:(59/255.0) blue:(94/255.0) alpha:1]];
    [button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    [_secondView addSubview:button];
    
    UILabel *buttonText = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth/2-30, 3, 60, 30)];
        buttonText.textColor =[UIColor colorWithRed:(202/255.0) green:(204/255.0) blue:(113/255.0) alpha:1];
    buttonText.text = @"编辑精选";
    buttonText.font = [UIFont systemFontOfSize:15];
    buttonText.userInteractionEnabled = NO;
    [button addSubview:buttonText];
    

    SelectionPostViewLayout *layout = [[SelectionPostViewLayout alloc]init];
    _selectionPostView = [[SelectionPostView alloc]initWithFrame:CGRectMake(0, 30, KScreenWidth, 270) collectionViewLayout:layout];
    _selectionPostView.backgroundColor = [UIColor colorWithRed:(55/255.0) green:(59/255.0) blue:(94/255.0) alpha:1];
    [_secondView addSubview:_selectionPostView];
    
    
    _newUserBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,290 , KScreenWidth,40)];
    _newUserBtn.backgroundColor = [UIColor whiteColor];
    [_secondView addSubview:_newUserBtn];
    
 
    [self  creatTitle:@"新人作品" AndImageIn:_newUserBtn];
    
    
    
    _newUserScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 330, KScreenWidth, 120)];
    [_secondView addSubview:_newUserScrollView];
    
    
    
    _newPostBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,450 , KScreenWidth,40)];
    _newPostBtn.backgroundColor = [UIColor whiteColor];
    [_secondView addSubview:_newPostBtn];
    
    [self creatTitle:@"最新足迹" AndImageIn:_newPostBtn];
    
    _newPostScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 490, KScreenWidth, 120)];
    [_secondView addSubview:_newPostScrollView];
    
    
    _tagsBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,610 , KScreenWidth,40)];
    _tagsBtn.backgroundColor = [UIColor whiteColor];
    [_secondView addSubview:_tagsBtn];
    

    [self creatTitle:@"标签" AndImageIn:_tagsBtn];

    
    _tagsScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 650, KScreenWidth, 80)];
    [_secondView addSubview:_tagsScrollView];
    
    
   
 
                                          
    
    
    
    
    
}
-(void)_loadData{
    
    headView.contentSize = CGSizeMake(KScreenWidth * _totalData.squarePicData.count, 140);
    _pageControl.numberOfPages = _totalData.squarePicData.count;
    
    
    for (int i = 0; i< _totalData.squarePicData.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(i * KScreenWidth,0 ,KScreenWidth, 140)];
        SquarePicModel *model = _totalData.squarePicData[i];
       
        [image sd_setImageWithURL:[NSURL URLWithString:model.activityImageUrl]];
        
        [headView addSubview:image];
        
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(i * KScreenWidth , 60, KScreenWidth, 20)];
        text.text = model.title;
        text.textAlignment = NSTextAlignmentCenter;
        text.font = [UIFont systemFontOfSize:15];
        text.textColor = [UIColor whiteColor];
        [headView addSubview:text];
        
    }
    
    _nearbyScrollView.contentSize = CGSizeMake(KScreenWidth * 0.7 * _totalData.squarenearPostArray.count + 20, KScreenWidth * 0.4);
    [self creatImageViesInScrollView:_nearbyScrollView WithData:_totalData.squarenearPostArray];
    

    
    
    _hotPostScrollView.contentSize = CGSizeMake(KScreenWidth * 0.7 * _totalData.squareHotPostArray.count + 20, KScreenWidth * 0.4);
    [self creatImageViesInScrollView:_hotPostScrollView WithData:_totalData.squareHotPostArray];
    
    _hotAlbumScrollView.contentSize = CGSizeMake(KScreenWidth * 0.7 * _totalData.squarehotAlbumArray.count + 20, KScreenWidth * 0.4);
    [self creatImageViesInScrollView:_hotAlbumScrollView WithData:_totalData.squarehotAlbumArray];
    
    _selectionPostView.squareselectionPostArray = _totalData.squareselectionPostArray;
    
    
    _newUserScrollView.contentSize = CGSizeMake(210 * _totalData.squarenewUserWorkArray.count, 120);
    [self creatImageViesInScrollView:_newUserScrollView WithData:_totalData.squarenewUserWorkArray];
    
    _newPostScrollView.contentSize = CGSizeMake(210 * _totalData.squareNewPostArray.count, 120);
    [self creatImageViesInScrollView:_newPostScrollView WithData:_totalData.squareNewPostArray];
    
    _tagsScrollView.contentSize = CGSizeMake(100* _totalData.squarenewUserWorkArray.count, 80);
    [self creatImageViesInScrollView:_tagsScrollView WithData:_totalData.squaretagsArray];
    
    
    self.headTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapAction:)];
    [headView addGestureRecognizer:self.headTap];
    
    self.nearTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapAction:)];
    [_nearbyScrollView addGestureRecognizer:self.nearTap];
    
    self.hotPostTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapAction:)];
    [_hotPostScrollView addGestureRecognizer:self.hotPostTap];

    self.postNewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapAction:)];
    [_newPostScrollView addGestureRecognizer:self.postNewTap];
    
    self.userNewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapAction:)];
    [_newUserScrollView addGestureRecognizer:self.userNewTap];
  
    
    
}
-(void)pageControlAction:(UIPageControl *)sender{
    
    NSInteger index = sender.currentPage;
    
    CGFloat contextOffSetX = index * KScreenWidth;
    
    CGPoint off = CGPointMake(contextOffSetX, 0);
    
    [headView setContentOffset:off animated:YES];
    
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offX =  headView.contentOffset.x;
    
    NSInteger index = offX/KScreenWidth;
    
    _pageControl.currentPage = index;
    
    
}
-(void)creatImageViesInScrollView:(UIScrollView *)view WithData:(NSArray *)data{
    
    
    for (int i = 0; i< data.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(i * ((view.contentSize.width-20)/data.count),0 ,(view.contentSize.width/data.count), view.bounds.size.height)];
        //image.contentMode = UIViewContentModeScaleAspectFit;
        SquarePicModel *model = data[i];
       
        if (model.postImg.length != 0 ) {
            [image sd_setImageWithURL:[NSURL URLWithString:model.postImg]];

        }
        else if (view == _hotAlbumScrollView){
            
            [image sd_setImageWithURL:[NSURL URLWithString:model.homePic]];
            

        }
        else if (view == _tagsScrollView)
        {
            
            [image sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
            
        }
        image.userInteractionEnabled = YES;
        
        
        [view addSubview:image];
        
    }
    
    

    
}

-(void)creatTitle:(NSString *)titel AndImageIn:(UIButton *)button{
    
    UILabel *Label = [[UILabel alloc]initWithFrame:CGRectMake(15, 17, 100, 15)];
    Label.text = titel;
    Label.textColor = [UIColor brownColor];
    Label.font = [UIFont systemFontOfSize:14];
    [button addSubview:Label];

    
    UIImageView *moreImage = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth-70, 20,45, 8)];
    moreImage.image = [UIImage imageNamed:@"more.png"];
    
    [button addSubview:moreImage];
    
}
-(void)tapAction{
    

    [[NSNotificationCenter defaultCenter]postNotificationName:@"tapHostPost" object:nil];
    

    
    
}


-(void)scrollViewTapAction:(UIGestureRecognizer *)tap{
    
    if (tap == self.headTap ) {
        
        [self tapActionInScrollView:headView WithTap:self.headTap AndDataArray:_totalData.squarePicData];
    }
    
  
    if (tap == self.nearTap ) {
        
        [self tapActionInScrollView:_nearbyScrollView WithTap:self.nearTap AndDataArray:_totalData.squarenearPostArray];
    }
    if (tap == self.hotPostTap ) {
        
        [self tapActionInScrollView:_hotPostScrollView WithTap:self.hotPostTap AndDataArray:_totalData.squareHotPostArray];
    }
//    if (tap == self.hotAlbumTap ) {
//        
//        [self tapActionInScrollView:_hotAlbumScrollView WithTap:self.hotAlbumTap AndDataArray:_totalData.squarehotAlbumArray];
//    }
    if (tap == self.userNewTap ) {
        
        [self tapActionInScrollView:_newUserScrollView WithTap:self.userNewTap AndDataArray:_totalData.squarenewUserWorkArray];
    }
    if (tap == self.postNewTap ) {
        
        [self tapActionInScrollView:_newPostScrollView WithTap:self.postNewTap AndDataArray:_totalData.squareNewPostArray];
    }
//    if (tap == self.tagsTap ) {
//        
//        [self tapActionInScrollView:_tagsScrollView WithTap:self.tagsTap AndDataArray:_totalData.squaretagsArray];
//    }
    

   
    

}


//
-(void)tapActionInScrollView:(UIScrollView *)scrollView WithTap:(UIGestureRecognizer *)tap AndDataArray:(NSArray *)array{
    if (scrollView == headView) {
        
        CGPoint touchLocation = [tap locationInView:scrollView];
        CGFloat XOffSet = touchLocation.x;
        
        NSInteger index = XOffSet / (scrollView.contentSize.width/array.count);
        
        SquarePicModel *model = array[index];

        NSString *type = model.type;
        
        if ([type isEqualToString:@"2"]) {
            
            WebViewController *webView = [[WebViewController alloc]init];
            
            webView.webViewUrl = model.Url;
            [self.viewController.navigationController pushViewController:webView animated:YES];
            
        }
        
        
    }else {
    
    
    CGPoint touchLocation = [tap locationInView:scrollView];
    CGFloat XOffSet = touchLocation.x;
    
    NSInteger index = XOffSet / (scrollView.contentSize.width/array.count);
    
    
    SquarePicModel *model = array[index];
    
    [PullToDetailsController pullToDetailsControllerWithController:self.viewController AndPostId:model.postId];

    
    }
}


@end
