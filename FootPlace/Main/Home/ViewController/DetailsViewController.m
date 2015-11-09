//
//  DetailsViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
#define commentRequestHeadUrl @"http://www.fotoplace.cc/api/stage/comment_list.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5"


#import "DetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "DetailsCell.h"
#import "WXLabel.h"
#import "RequestUrlConnection.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
{
    
    UIScrollView *_baseScrollView;
    
    
    UIView *_headView;
    UIButton *_headBackBtn;
    
    UIImageView *_imageView;
    
    
    UILabel *_contextLabel;
    
    UIButton *_headBtn;
    UIImageView *_headImageView;
    UILabel *_headLabel;
    
    UIView *_addressView;
    UIImageView *_addressImage;
    UILabel *_addressText;
    
    UIButton *_likesBtn;
  
    
    UITableView *_tableView;
    
    
    CGFloat _totalHeight;
    
    NSDictionary *_data;
    NSArray *_comments;
    NSString *_totalCount;
    
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    
   [self _creatView];
    // Do any additional setup after loading the view.
}

-(void)setLayout:(DetailsLayoutFrame *)layout{
    if (_layout != layout) {
        _layout = layout;
        
        [self setLayoutFrameAndData];
        }
    
    
    
    
}

-(void)_creatView{
    
   
    
    _baseScrollView = [[UIScrollView alloc]init];
    _baseScrollView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeigth);
    _baseScrollView.contentSize = CGSizeMake(KScreenWidth, KScreenHeigth);
    _baseScrollView.backgroundColor = [UIColor whiteColor];
    _baseScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_baseScrollView];
    
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, KScreenWidth, 40)];
    [_baseScrollView addSubview:_headView];
    _headBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/2-150, 0, 300, 40)];
    [_headView addSubview:_headBtn];
    _headBackBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
    [_headBackBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [_headBackBtn setBackgroundImage:[UIImage imageNamed:@"details_back"] forState:UIControlStateNormal];
    [_headView addSubview:_headBackBtn];
    
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 5, 30, 30)];
    _headImageView.layer.cornerRadius = 15;
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.borderWidth = 1;
    _headImageView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    [_headBtn addSubview:_headImageView];
    
    _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headBtn.bounds.size.width/2-50, 10, 100, 20)];
    _headLabel.font = [UIFont systemFontOfSize:14];
    _headLabel.textAlignment = NSTextAlignmentCenter;
    [_headBtn addSubview:_headLabel];
    
    
    
    
    
    _imageView = [[UIImageView alloc]init];
    [_baseScrollView addSubview:_imageView];
    
    _contextLabel = [[UILabel alloc]init];
    _contextLabel.font = [UIFont systemFontOfSize:13];
    [_baseScrollView addSubview:_contextLabel];
    
    _addressView = [[UIView alloc]init];
    [_baseScrollView addSubview:_addressView];
    
    _addressImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 1, 14, 18)];
    _addressImage.image = [UIImage imageNamed:@"userinside_location"];
    [_addressView addSubview:_addressImage];
    
    
    
    
    
    _addressText = [[UILabel alloc]initWithFrame:CGRectMake(37, 0, 100, 20)];
    _addressText.font = [UIFont systemFontOfSize:13];
    _addressText.textColor = [UIColor grayColor];
    [_addressView addSubview:_addressText];
    
    
    
    _likesBtn = [[UIButton alloc]init];
    [_baseScrollView addSubview:_likesBtn];
    
    
    
    
    
    
}

-(void)setLayoutFrameAndData{
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:_layout.model.avatar]];
    
    _headLabel.text = _layout.model.userName;
    
   
    
    _imageView.frame = _layout.imageViewFrame;
   
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_layout.model.imgUrlBig]];
    
    
    _contextLabel.text = _layout.model.text;
    _contextLabel.frame = _layout.contextFrame;
    
    _addressText.text = _layout.model.address;
    
    _addressView.frame = _layout.addressFrame;
    
    NSArray *likes = _layout.model.likes;
    
    NSUInteger x = 0;
    
   
    if (likes.count <= 7 &&likes.count != 0) {
        x = likes.count;
        
    }else if (likes.count >= 7){
        
        x = 7;
        
    }
    
    
    if (likes.count > 0) {
    
        
    for (int i = 0; i < x && 0 < x; i++) {
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10 + i * 35, 10, 30 , 30)];
        image.layer.cornerRadius = 15;
        image.layer.masksToBounds = YES;
    
        NSDictionary *dic = likes[i];
       [image sd_setImageWithURL:[NSURL URLWithString:dic[@"avatar"]]];
        
        [_likesBtn addSubview:image];
    }
    }
    
            UILabel *image = [[UILabel alloc]initWithFrame:CGRectMake(10 + x * 35, 10, 30 , 30)];
        image.layer.cornerRadius = 15;
        image.layer.masksToBounds = YES;
        image.backgroundColor = [UIColor grayColor];
        image.textAlignment = NSTextAlignmentCenter;
        image.textColor = [UIColor whiteColor];
        image.text = _layout.model.likeCount;
        [_likesBtn addSubview:image];
    
    
    
    _likesBtn.frame = _layout.likesFrame;
    
    
    
    _totalHeight = CGRectGetMaxY(_likesBtn.frame);
       _baseScrollView.contentSize = CGSizeMake(KScreenWidth,CGRectGetMaxY(_likesBtn.frame) + 50);
    
    if (_layout.model.comments.count != 0) {
       
        
        NSString *params = [NSString stringWithFormat:@"id=%@&sinceId=0&type=0&size=15",_layout.model.postId];
        NSString *url = [commentRequestHeadUrl stringByAppendingFormat:@"&%@",params];
        
        [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
            NSDictionary *dic =  result;
            _data = dic[@"data"];
            _comments = _data[@"comments"];
            
            _totalCount = _data[@"totalCount"];
            [self creatCommentsTableView];

            
           
        }];
        
        
    }else{
        
        _tableView = nil;
    }
   
}
-(void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _comments.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[DetailsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DetailsCell"];
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.cellData = _comments[indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text = _comments[indexPath.row][@"text"];
    
    CGFloat textHeight = [WXLabel getTextHeight:14 width:KScreenWidth-90 text:text linespace:5.0];
    
    _totalHeight += textHeight+70;
      return textHeight+70;
    
   
}

-(void)creatCommentsTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   // _tableView.scrollEnabled = NO;
    _tableView.bounces = NO;
    
     _tableView.frame = CGRectMake(0, CGRectGetMaxY(_likesBtn.frame), KScreenWidth, KScreenHeigth);
    
    [_tableView registerClass:[DetailsCell class] forCellReuseIdentifier:@"DetailsCell"];
    
    [_baseScrollView addSubview:_tableView];
    
   
      _baseScrollView.contentSize = CGSizeMake(KScreenWidth,CGRectGetMaxY(_likesBtn.frame) + KScreenHeigth);

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    lable.text = [NSString stringWithFormat:@"评论 %@",_totalCount];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    lable.backgroundColor = [UIColor lightGrayColor];
    
    
    return  lable;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
