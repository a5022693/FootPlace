//
//  DiscoverViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverViewCell.h"
#import "headerCell.h"
#import "RequestUrlConnection.h"
#import "UIImageView+WebCache.h"


@interface DiscoverViewController ()

@end

@implementation DiscoverViewController
{
    
    NSArray *_discoverAarray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self creatViews];
   
   
    
}
-(void)creatViews{
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(76/255.0) green:(75/255.0) blue:(74/255.0) alpha:1];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}
     ];
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth / 2, 32, 30, 20)];
    [commentLabel setText:@"发现"];
    [commentLabel setTextColor:[UIColor whiteColor]];
    commentLabel.font = [UIFont systemFontOfSize:19];
    commentLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = commentLabel;
    
}

-(void)loadData{
    _discoverAarray = [[NSArray alloc]init];
    
    NSString *url = @"http://www.fotoplace.cc/api2/discover/discover_timeline.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&lat=30.319592&lng=120.35106&pageIndex=0";
    
    [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        
        NSDictionary *dicData = dic[@"data"];
        
        [self readDataWith:dicData];
        
    }];
    
    
}

-(void)_creatCollectionView{
    
    
    DiscoverCollectionViewFolwLayout *layout = [[DiscoverCollectionViewFolwLayout alloc]init];
    
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth-64-49) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
   
    
    [self.view addSubview:collectionView];
    
    
    [collectionView registerClass:[DiscoverViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _discoverAarray.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    DiscoverViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell.imageView removeFromSuperview];
    [cell.folderName removeFromSuperview];
    [cell.addressLabel removeFromSuperview];
    cell.imageView.frame = cell.bounds;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_discoverAarray[indexPath.item][@"imgUrl"]]];
        [cell.contentView addSubview:cell.imageView];
        cell.backgroundColor = [UIColor whiteColor];
    
    cell.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(3,CGRectGetHeight(cell.bounds)-15, cell.bounds.size.width, 13)];
    cell.addressLabel.text = _discoverAarray[indexPath.item][@"cities"];
    cell.addressLabel.textColor = [UIColor whiteColor];
    cell.addressLabel.font = [UIFont systemFontOfSize:13];
    
    [cell.contentView addSubview:cell.addressLabel];
    
    
    cell.folderName = [[UILabel alloc]initWithFrame:CGRectMake(3,CGRectGetHeight(cell.bounds)-30, cell.bounds.size.width, 13)];
    cell.folderName.text = [NSString stringWithFormat:@"%@ %@",_discoverAarray[indexPath.item][@"folderCName"],_discoverAarray[indexPath.item][@"folderEName"]];
    cell.folderName.font = [UIFont systemFontOfSize:13];
    cell.folderName.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:cell.folderName];
    
    
    
    
        return cell;
    
}

-(void)readDataWith:(NSDictionary *)dicData{
    
    _discoverAarray = dicData[@"footprintFolders"];
    
    
     [self _creatCollectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
