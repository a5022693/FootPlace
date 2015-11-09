//
//  ProfileViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "ProfileViewController.h"
#import "PictureViewController.h"
#import "CollectionViewController.h"
#import "GoneViewController.h"
#import "ZanViewController.h"
#import "SearchViewController.h"
#import "ConfigViewController.h"
#import "ConcernViewController.h"
#import "FansViewController.h"
#import "ProfileModel.h"
#import "RequestUrlConnection.h"
#import "UIImageView+WebCache.h"
#import "RequestUrlConnection.h"
#import "ConcernCell.h"
#import "FansCell.h"
#import "UIViewExt.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController{
    UIImageView *bgImageView;
    RequestUrlConnection *_request;
    ProfileModel *_profileModel;
    
    UIImageView *headImage;
    UILabel *zujiLabel;
    UIButton *concernBtn;
    UIButton *fansBtn;
    UILabel *label1;
    UILabel *concernLabel;
    UILabel *fansLabel;
    UILabel *label4;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createNavigationBar];
    [self _createTableView];
    [self _loadData];
}
-(void)_loadData
{
    NSString *url = @"http://www.fotoplace.cc/api2/user/user_show.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&targetUid=22479779&targetUserName=";
    [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        _profileModel = [[ProfileModel alloc]initWithDataDic:dic];
        self.title = [NSString stringWithFormat:@"%@",_profileModel.userName];
        [self readDatawithModel:_profileModel];
        
    }];
    
    
}

- (void)_createTableView{
    //创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    //背景
    bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 280)];
    bgImageView.image = [UIImage imageNamed:@"bg.jpg"];
    [tableView addSubview:bgImageView];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 280)];
    [button addTarget:self action:@selector(sheetAction:) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:button];
    
    //足记Label
    zujiLabel = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth/2-60, 20, 120, 20)];
    
    zujiLabel.textAlignment = NSTextAlignmentCenter;
    zujiLabel.textColor = [UIColor whiteColor];
    zujiLabel.font = [UIFont systemFontOfSize:13];
    [tableView addSubview:zujiLabel];
    //头像
    headImage = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth/2-40, 60, 80, 80)];
    
    headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    headImage.layer.borderWidth = 1;
    headImage.layer.cornerRadius = 40;
    headImage.layer.masksToBounds = YES;
    [tableView addSubview:headImage];
    //线
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth/2-1, 160, 2, 30)];
    lineImage.image = [UIImage imageNamed:@"tab_bg"];
    [tableView addSubview:lineImage];
    
    //关注
    concernBtn = [[UIButton alloc]initWithFrame:CGRectMake(80, 160, KScreenWidth/2 - 80, 30)];
    [concernBtn addTarget:self action:@selector(ConcernAction:) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:concernBtn];
    concernLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth/2 - 80, 30)];
    
    concernLabel.textAlignment = NSTextAlignmentCenter;
    concernLabel.textColor = [UIColor whiteColor];
    concernLabel.font = [UIFont systemFontOfSize:15];
    [concernBtn addSubview:concernLabel];
    //粉丝
    fansBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/2, 160, KScreenWidth/2 - 80, 30)];
    
    [fansBtn addTarget:self action:@selector(FansAction:) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:fansBtn];
    fansLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth/2 - 80, 30)];
    
    fansLabel.textAlignment = NSTextAlignmentCenter;
    fansLabel.textColor = [UIColor whiteColor];
    fansLabel.font = [UIFont systemFontOfSize:15];
    [fansBtn addSubview:fansLabel];
    //遮盖视图
    UIView *maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 220, KScreenWidth, 60)];
    maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [tableView addSubview:maskView];
    UIButton *PictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 50, 20)];
    label1.text = @"影集";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:13];
    datalabel1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 50, 20)];
    
    datalabel1.textAlignment = NSTextAlignmentCenter;
    datalabel1.textColor = [UIColor whiteColor];
    datalabel1.font = [UIFont systemFontOfSize:13];
    
    PictureBtn.frame = CGRectMake(0, 0, KScreenWidth/4, 60);
    
    [PictureBtn addTarget:self action:@selector(PictureAction:) forControlEvents:UIControlEventTouchUpInside];
    [maskView addSubview:PictureBtn];
    [PictureBtn addSubview:label1];
    [PictureBtn addSubview:datalabel1];
    
    UIButton *CollectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CollectionBtn.frame = CGRectMake(KScreenWidth/4, 0, KScreenWidth/4, 60);
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 50, 20)];
    label2.text = @"收藏";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:13];
    datalabel2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 50, 20)];
    datalabel2.text = @"0";
    datalabel2.textAlignment = NSTextAlignmentCenter;
    datalabel2.textColor = [UIColor whiteColor];
    datalabel2.font = [UIFont systemFontOfSize:13];
    
    
    [CollectionBtn addTarget:self action:@selector(CollectionAction:) forControlEvents:UIControlEventTouchUpInside];
    [maskView addSubview:CollectionBtn];
    [CollectionBtn addSubview:label2];
    [CollectionBtn addSubview:datalabel2];
    
    UIButton *GoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    GoneBtn.frame = CGRectMake(KScreenWidth/2, 0, KScreenWidth/4, 60);
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 50, 20)];
    label3.text = @"去过";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:13];
    datalabel3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 50, 20)];
    datalabel3.text = @"0";
    datalabel3.textAlignment = NSTextAlignmentCenter;
    datalabel3.textColor = [UIColor whiteColor];
    datalabel3.font = [UIFont systemFontOfSize:13];
    
    [GoneBtn addTarget:self action:@selector(GoneAction:) forControlEvents:UIControlEventTouchUpInside];
    [maskView addSubview:GoneBtn];
    [GoneBtn addSubview:label3];
    [GoneBtn addSubview:datalabel3];
    
    UIButton *ZanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ZanBtn.frame = CGRectMake(KScreenWidth/4*3, 0, KScreenWidth/4, 60);
    label4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 50, 20)];
    label4.text = @"赞";
    label4.textAlignment = NSTextAlignmentCenter;
    label4.textColor = [UIColor whiteColor];
    label4.font = [UIFont systemFontOfSize:13];
    datalabel4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 50, 20)];
    
    datalabel4.textAlignment = NSTextAlignmentCenter;
    datalabel4.textColor = [UIColor whiteColor];
    datalabel4.font = [UIFont systemFontOfSize:13];
    [ZanBtn addTarget:self action:@selector(ZanAction:) forControlEvents:UIControlEventTouchUpInside];
    [maskView addSubview:ZanBtn];
    [ZanBtn addSubview:label4];
    [ZanBtn addSubview:datalabel4];
}

// 滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取滑动视图的y偏移
    CGFloat yOffset = scrollView.contentOffset.y ;
    
    if (yOffset < 0)
    {
        // 图片的原始高度
        CGFloat oldImageHeight = 280;
        // 图片的变化后的高度
        CGFloat newImageHeight = 280 - yOffset;
        // 放大的比例
        CGFloat scale = newImageHeight / oldImageHeight;
        
        // 放大图片
        CGAffineTransform transfrom = CGAffineTransformMakeScale(scale, scale);
        bgImageView.transform = transfrom;
        
        // 改变图片的位置
        bgImageView.top = yOffset;
    }
    
    
}

#pragma mark - tabelViewDatasource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    if(indexPath.row ==1)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.borderWidth = 2;
        button.layer.borderColor = [UIColor grayColor].CGColor;
        [button setImage:[UIImage imageNamed:@"user_myself_addalbum"] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, KScreenWidth, 55);
//        button.backgroundColor = [UIColor redColor];
        [cell addSubview:button];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 280;
    }else if (indexPath.row == 1){
        return 55;
    }else{
        return 100;
    }
}

-(void)PictureAction:(UIButton *)sender
{
    PictureViewController *vc = [[PictureViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)CollectionAction:(UIButton *)sender
{
    CollectionViewController *vc = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)GoneAction:(UIButton *)sender
{
    GoneViewController *vc = [[GoneViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)ZanAction:(UIButton *)sender
{
    ZanViewController *vc = [[ZanViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)ConcernAction:(UIButton *)sender
{
    ConcernViewController *vc = [[ConcernViewController alloc]init];
    NSString *url = @"http://www.fotoplace.cc/api2/user/user_followings.php?uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.319592&lng=120.35106&targetUid=22479779&targetUserName=&offset=0";
    [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic1 = result;
        
//        ConcernCell *cell = [[ConcernCell alloc]init];
        NSDictionary *dic2 = dic1[@"data"];
        NSArray *array = dic2[@"users"];
        
        
        vc.celldata = array;
    [self.navigationController pushViewController:vc animated:YES];
    }];

}
-(void)FansAction:(UIButton *)sender
{
    FansViewController *vc = [[FansViewController alloc]init];
    NSString *url = @"http://www.fotoplace.cc/api2/user/user_followers.php?uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.31951141357422&lng=120.35103607177734&targetUid=22479779&targetUserName=&offset=0";
    [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic1 = result;
        
      //  FansCell *cell = [[FansCell alloc]init];
        NSDictionary *dic2 = dic1[@"data"];
        NSArray *array = dic2[@"users"];
        
        
        vc.celldata = array;
    [self.navigationController pushViewController:vc animated:YES];
    }];

}
-(void)sheetAction:(UIButton *)sender
{
   
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:nil
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"更换背景图",@"查看背景图",nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [actionSheet showInView:self.view];
    
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    UIImagePickerControllerSourceType sourceType;
    //更换背景图
    if (buttonIndex == 0) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else if (buttonIndex == 1){
        
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

//图片选择代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    //取出照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    bgImageView.image = image;
}
-(void)_createNavigationBar
{
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(76/255.0) green:(75/255.0) blue:(74/255.0) alpha:1];
//    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:17],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}
     ];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 55, 51);
    [leftBtn setImage:[UIImage imageNamed:@"searchfriend@2x"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"search07@2x"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftitem;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 55, 51);
    [rightBtn setImage:[UIImage imageNamed:@"setting_normal"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"setting_press"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(configAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightitem;

}
-(void)readDatawithModel:(ProfileModel *)model{
    
    NSString *headerImamgeUrl = _profileModel.avatar;
    
    [headImage sd_setImageWithURL:[NSURL URLWithString:headerImamgeUrl]];
    zujiLabel.text =[NSString stringWithFormat: @"足记号：%@", _profileModel.uid];
    concernLabel.text = [NSString stringWithFormat:@"关注：%@",_profileModel.followingCount];
    fansLabel.text =[NSString stringWithFormat:@"粉丝：%@", _profileModel.followerCount];
    datalabel4.text = _profileModel.likeCount;
    datalabel1.text = _profileModel.albumCount;
}

-(void)searchAction:(UIButton *)sender
{
    SearchViewController *vc = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)configAction:(UIButton *)sender
{
    ConfigViewController *vc = [[ConfigViewController alloc]init];
    vc.model = _profileModel;

    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
