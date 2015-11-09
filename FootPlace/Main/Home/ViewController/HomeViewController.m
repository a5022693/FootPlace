//
//  HomeViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#define baseHomeDataUrl @"http://www.fotoplace.cc/api/stage/follow/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5"

#define concernLoadMoreData @"http://www.fotoplace.cc/api/stage/follow/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lastPostId=44033910&offset=15&sinceId=44023956&lat=30.319618&lng=120.351135&city=%E6%9D%AD%E5%B7%9E%E5%B8%82"

#define squareLoadMoreData @"http://www.fotoplace.cc/api/square/ranked_list.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5"
#define city @"&city=%E6%9D%AD%E5%B7%9E%E5%B8%82";

#import "HomeViewController.h"
#import "UserTabbleView.h"
#import "AFNetworking.h"
#import "UserModel.h"
#import "SquareModel.h"
#import "SquarePicModel.h"
#import "HomeLayoutFrame.h"
#import "HomeHeaderView.h"
#import "SquareTabbleView.h"
#import "SquarePictureView.h"
#import "SquareLayoutFrame.h"
#import "SquarePictureView.h"
#import "SquarePicTotalData.h"
#import "RequestUrlConnection.h"
#import "MJRefresh.h"



@interface HomeViewController ()

@end

@implementation HomeViewController{
    
    UserTabbleView *_userTableView;
    SquareTabbleView *_squareTableView;
    SquarePictureView *_squarePicView;
    UIScrollView *_secondView;
    
    
    NSOperationQueue *queue;
    NSDictionary *_homeData;
    NSDictionary *_squareData;
    NSDictionary *_squarePicData;
    NSMutableArray *homeDataArray;
    NSMutableArray *_squareArray;
    
    HomeHeaderView *_headerView;
    
    UIScrollView *_baseView;
    
    
    NSMutableArray *dataArray;
    NSMutableArray *_squarePicArray;
    NSMutableArray *_squareHotPostArray;
    NSMutableArray *_squarehotAlbumArray;
    NSMutableArray *_squarenearPostArray;
    NSMutableArray *_squarenewPostArray;
    NSMutableArray *_squarenewUserWorkArray;
    NSMutableArray *_squareselectionPostArray;
    NSMutableArray *_squaretagsArray;
       
    SquarePicTotalData *totalData;

    NSInteger x;
    
    NSMutableArray *_newData;
    
    NSString *lastPostId;
    NSString *sinceId;
}

-(void)dealloc{
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadData];
    
    [self _creatItemButtonsView];
    
    [self addNotificationCenter];
    //[self _creatTabbleView];

    [self _creatViews];
    [self creatHomeView];
    [self creatSquareTabView];
    
    x = 1;
    homeDataArray = [[NSMutableArray alloc]init];

}

-(void)addNotificationCenter{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(concernAction) name:@"tapConcern" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(squareAction) name:@"tapSquare" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(HotPostAction) name:@"tapHostPost" object:nil];
   
    
}

-(void)_loadData{
  
   //关注页面的数据请求
    NSString *homeUrlString = @"http://www.fotoplace.cc/api/stage/follow/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.2.1&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5";
    
    
    [RequestUrlConnection requestWithUrlString:homeUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
          NSLog(@"关注数据下载成功");
        _homeData = result;
        [self readDataWithHomeData:_homeData];
        
    }];
    NSString *squarePicUrlString = @"http://www.fotoplace.cc/api/square/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.319663&lng=120.351098&city=0571";
    
    NSString *squareUrlString = @"http://www.fotoplace.cc/api/square/ranked_list.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5";
    
    [RequestUrlConnection requestWithUrlString:squarePicUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
          NSLog(@"广场图片数据下载成功");
        
        _squarePicData = result;
        
           [self readDataWithSquarePicData:_squarePicData];
    }];
   
    [RequestUrlConnection requestWithUrlString:squareUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
          NSLog(@"广场数据下载成功");
        _squareData = result;
     
        [self readDataWithSquareData:_squareData];
        
        
    }];
    
}
#pragma mark - 关注下拉刷新
- (void)loadNewData {

    //关注页面的数据请求
    NSString *homeUrlString = baseHomeDataUrl;
    NSString *cityname = city;
    
    homeUrlString = [homeUrlString stringByAppendingFormat:@"&lastPostId=%@&offset=15&sinceId=0&lat=30.319618&lng=120.351135%@",lastPostId,cityname];

    
    [RequestUrlConnection requestWithUrlString:homeUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        
        [homeDataArray removeAllObjects];
        
        [self readDataWithHomeData:dic];
    }];
    NSString *squarePicUrlString = @"http://www.fotoplace.cc/api/square/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.319663&lng=120.351098&city=0571";
    
    NSString *squareUrlString = @"http://www.fotoplace.cc/api/square/ranked_list.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5";
    
    [RequestUrlConnection requestWithUrlString:squarePicUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
       
        _squarePicData = result;
        
        [self readDataWithSquarePicData:_squarePicData];
    }];
    
    [RequestUrlConnection requestWithUrlString:squareUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        [_squareArray removeAllObjects];
        _squareData = result;
        
        [self readDataWithSquareData:_squareData];
        
        
    }];

}

#pragma mark - 关注上拉加载
- (void)loadMoreData {
    
//    http://www.fotoplace.cc/api/stage/follow/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lastPostId=44033910&offset=15&sinceId=0&lat=30.319618&lng=120.351135&city=%E6%9D%AD%E5%B7%9E%E5%B8%82
    
    //关注页面的数据请求
    NSString *homeUrlString = baseHomeDataUrl;
    NSString *cityname = city;
    
    homeUrlString = [homeUrlString stringByAppendingFormat:@"&lastPostId=%@&offset=15&sinceId=%@&lat=30.319618&lng=120.351135%@",lastPostId,sinceId,cityname];
    
    
    [RequestUrlConnection requestWithUrlString:homeUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        [self readDataWithHomeData:dic];
        

    }];
    NSString *squarePicUrlString = @"http://www.fotoplace.cc/api/square/index.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.319663&lng=120.351098&city=0571";
    
    NSString *squareUrlString = @"http://www.fotoplace.cc/api/square/ranked_list.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5";
    
    [RequestUrlConnection requestWithUrlString:squarePicUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        _squarePicData = result;
        
        [self readDataWithSquarePicData:_squarePicData];
    }];
    
    [RequestUrlConnection requestWithUrlString:squareUrlString Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        _squareData = result;
        
        [self readDataWithSquareData:_squareData];
        
        
    }];


    [_userTableView.footer endRefreshing];
}

-(void)readDataWithHomeData:(NSDictionary *)homeData{
    
//    [self creatHomeView];
    
    NSDictionary *data = homeData[@"data"];
   
    NSArray *resultArray = data[@"resultSet"];
    
    for (NSDictionary *dic in resultArray) {
        
        
        UserModel *model = [[UserModel alloc]initWithDataDic:dic];
        
        HomeLayoutFrame *layout = [[HomeLayoutFrame alloc]init];
        layout.userModel = model;
        if (dic == [resultArray firstObject]) {
            lastPostId = model.postId;
            NSLog(@"lastpostid = %@",lastPostId);
        }
        if (dic == [resultArray lastObject]) {
            sinceId = model.postId;
            NSLog(@"sinceid = %@",sinceId);
        }
        
        
        
        [homeDataArray addObject:layout];
        
    }
  
    if (homeDataArray != nil) {
       _userTableView.homeData = homeDataArray;
        
    }
    [_userTableView reloadData];
    
    [_userTableView.header endRefreshing];
    
}
-(void)readDataWithSquarePicData:(NSDictionary *)squarePicData{
   // _squarePicArray = [[NSMutableArray alloc]init];
    NSDictionary *data = squarePicData[@"data"];
    if (data != nil) {
       // _squareTableView.squarePicData = data;
        
        [self readtotalData:data];
    }
    
    [_squarePicView reloadInputViews];
    
   [self creatSquarePicView];
   
    
}

-(void)readDataWithSquareData:(NSDictionary *)squareData{
    
//     [self creatSquareTabView];
    
    NSDictionary *data = squareData[@"data"];
    _squareArray = [[NSMutableArray alloc]init];
    
    NSArray *list = data[@"list"];
    
    for (NSDictionary *dic in list) {
        SquareModel *model = [[SquareModel alloc]initWithDataDic:dic];
        
        SquareLayoutFrame *layout = [[SquareLayoutFrame alloc]init];
        layout.squareModel = model;
        
        
        [_squareArray addObject:layout];
        
    }
    
    if (_squareArray != nil) {
        _squareTableView.squareData = _squareArray;
        
    }
 
    [_squareTableView reloadData];
}

- (void)_creatViews{
    
    _baseView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth)];
    
    _baseView.contentSize = CGSizeMake(KScreenWidth * 2, KScreenHeigth);
    _baseView.pagingEnabled = YES;
    _baseView.delegate = self;
    _baseView.bounces = NO;

    [self.view addSubview:_baseView];
    
     _secondView= [[UIScrollView alloc]initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, KScreenHeigth-64-49)];
    _secondView.contentSize = CGSizeMake(KScreenWidth,(KScreenHeigth-64-49) * 3+70);
    [_baseView addSubview:_secondView];

   
    _secondView.delegate = self;


}

-(void)creatHomeView{
    
    
    _userTableView = [[UserTabbleView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeigth-64-49) style:UITableViewStylePlain];
    
    
    [_baseView addSubview:_userTableView];
    
    
    _userTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    _userTableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
}

-(void)creatSquarePicView{
  
    _squarePicView= [[SquarePictureView alloc]init];
    _squarePicView.frame = CGRectMake(0, 0, KScreenWidth,(KScreenHeigth-64-49) * 2 + 70);
    _squarePicView.backgroundColor = [UIColor grayColor];
    _squarePicView.totalData = totalData;
    [_secondView addSubview:_squarePicView];
    

}
-(void)creatSquareTabView{
    
    _squareTableView = [[SquareTabbleView alloc]initWithFrame:CGRectMake(0,(KScreenHeigth-64-49) * 2 + 70, KScreenWidth, KScreenHeigth-64) style:UITableViewStylePlain];
    _squareTableView.backgroundColor = [UIColor yellowColor];
    _squareTableView.scrollEnabled = NO;
    
    [_secondView addSubview:_squareTableView];

    _squareTableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreSquareData)];
    
}
#pragma mark - 广场上拉加载
- (void)loadMoreSquareData {
    NSLog(@"加载广场数据");

    NSString *squareUrlString = squareLoadMoreData;

    x++;
    
    NSString *url = [squareUrlString stringByAppendingFormat:@"&page=%li&size=15",x];
    
    [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        _squareData = result;
        
        [self readDataWithSquareData:_squareData];
        
        
    }];
    
    [_squareTableView.footer endRefreshing];

}
-(void)_creatItemButtonsView{
    
    self.navigationController.navigationBarHidden = YES;
    _headerView = [[HomeHeaderView alloc]init];
    _headerView.frame = CGRectMake(0, 0, KScreenWidth, 64);
    //headView.backgroundColor =[UIColor blackColor];
    [self.view addSubview: _headerView];
    
    

}
-(void)concernAction{
    _headerView.concernBtn.selected = NO;
    _headerView.squareBtn.selected = NO;
    _headerView.concernText.textColor = [UIColor whiteColor];
    _headerView.squareText.textColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:0.2 animations:^{
          [_baseView setContentOffset:CGPointMake(0, 0)];
    }];
  
    
    [self changeHeaderViewFrame];
    
}
-(void)squareAction{
    _headerView.concernBtn.selected = YES;
    _headerView.squareBtn.selected = YES;
    _headerView.squareText.textColor = [UIColor whiteColor];
    _headerView.concernText.textColor = [UIColor  lightGrayColor];
    [UIView animateWithDuration:0.2 animations:^{
        [_baseView setContentOffset:CGPointMake(KScreenWidth, 0)];
    }];
    
     [self changeHeaderViewFrame];
 
}

-(void)changeHeaderViewFrame{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _headerView.frame = CGRectMake(0, 0, KScreenWidth, 90);
        
        [self.view addSubview:_headerView];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            [UIView setAnimationDelay:0.5];
            _headerView.frame = CGRectMake(0, 0, KScreenWidth, 64);
            [self.view addSubview:_headerView];
        }];
        
        
    }];
    
    
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    if (scrollView == _baseView) {
        
        if (velocity.x > 0) {
            
            [self squareAction];
        }
        else if (velocity.x < 0 )
        {
            [self concernAction];
        }
    }
   
    
    if (scrollView == _secondView) {
        if (scrollView.contentOffset.y >= (KScreenHeigth-64-49) * 2 + 70) {
            
            _squareTableView.scrollEnabled = YES;
        }
        else{
            
            _squareTableView.scrollEnabled = NO;
        }
        
    }
    
    
}
-(void)readtotalData:(NSDictionary *)data{
    totalData= [[SquarePicTotalData alloc]init];
    _squarePicArray = [[NSMutableArray alloc]init];
    _squarehotAlbumArray  = [[NSMutableArray alloc]init];
    _squareHotPostArray  = [[NSMutableArray alloc]init];
    _squarenearPostArray= [[NSMutableArray alloc]init];
    _squarenewPostArray = [[NSMutableArray alloc]init];
    _squarenewUserWorkArray  = [[NSMutableArray alloc]init];
    _squareselectionPostArray= [[NSMutableArray alloc]init];
    _squaretagsArray= [[NSMutableArray alloc]init];
    
    
    NSDictionary *header = data[@"header"];
    NSArray *activitiesArray = header[@"activities"];
    [self analysisDataWithModel:activitiesArray andAddtoMutableArray:_squarePicArray];
    totalData.squarePicData = _squarePicArray;
    
    
    NSDictionary *hotAlbum = data[@"hotAlbum"];
    NSArray *albumListItemDtos = hotAlbum[@"albumListItemDtos"];
    [self analysisDataWithModel:albumListItemDtos andAddtoMutableArray:_squarehotAlbumArray];
    totalData.squarehotAlbumArray = _squarehotAlbumArray;
    
    
    NSDictionary *hotPost = data[@"hotPost"];
    NSArray *hotPostList = hotPost[@"hotPostList"];
    [self analysisDataWithModel:hotPostList andAddtoMutableArray:_squareHotPostArray];
    totalData.squareHotPostArray = _squareHotPostArray;
    
    NSDictionary *nearPost = data[@"nearPost"];
    NSArray *nearByPostList = nearPost[@"nearByPostList"];
    [self analysisDataWithModel:nearByPostList andAddtoMutableArray:_squarenearPostArray];
    totalData.squarenearPostArray = _squarenearPostArray;
    
    NSDictionary *newUserWork = data[@"newUserWork"];
    NSArray *newUserPostList = newUserWork[@"newUserPostList"];
    [self analysisDataWithModel:newUserPostList andAddtoMutableArray:_squarenewUserWorkArray];
    totalData.squarenewUserWorkArray = _squarenewUserWorkArray;
    
    NSDictionary *newPost = data[@"newPost"];
    NSArray *newPostList = newPost[@"newPostList"];
    [self analysisDataWithModel:newPostList andAddtoMutableArray:_squarenewPostArray];
    totalData.squareNewPostArray = _squarenewPostArray;
    
    NSDictionary *selectionPost = data[@"selectionPost"];
    NSArray *selectPostList = selectionPost[@"selectPostList"];
    [self analysisDataWithModel:selectPostList andAddtoMutableArray:_squareselectionPostArray];
    totalData.squareselectionPostArray = _squareselectionPostArray;
    
    NSDictionary *tags = data[@"tags"];
    NSArray *tagList = tags[@"tagList"];
    [self analysisDataWithModel:tagList andAddtoMutableArray:_squaretagsArray];
    totalData.squaretagsArray = _squaretagsArray;
    
    
    
}
-(void)analysisDataWithModel:(NSArray *)DataArray andAddtoMutableArray:(NSMutableArray *)mutableArray{
    
    for (NSDictionary *dic in DataArray) {
        SquarePicModel *model = [[SquarePicModel alloc]initWithDataDic:dic];
        [mutableArray addObject:model];
    }
    
}

-(void)HotPostAction{
    
    [_secondView setContentOffset:CGPointMake(0, KScreenHeigth-64-49-40) animated:YES];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == _secondView) {
        if (scrollView.contentOffset.y >= (KScreenHeigth-64-49) * 2 + 70) {
            
            _squareTableView.scrollEnabled = YES;
        }
        else{
            
            _squareTableView.scrollEnabled = NO;
        }
        
    }
    
    
    
}
-(void)readDic:(NSDictionary *)dic AndaddToData:(NSArray *)array{
    
    
    
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
