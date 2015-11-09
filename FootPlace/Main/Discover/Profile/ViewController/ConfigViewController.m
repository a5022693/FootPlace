//
//  ConfigViewController.m
//  FootPlace
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "ConfigViewController.h"
#import "InformationViewController.h"
#import "UIImageView+WebCache.h"    
static NSString *profileCellId = @"profileCellId";
@interface ConfigViewController ()

@end

@implementation ConfigViewController
{
    UILabel *_cacheLabel;
    UIImageView *image;
    UILabel *namelabel;
    
    NSString *headerImageUrl;
}
-(void)setModel:(ProfileModel *)model{
    if (_model != model) {
        _model = model;
        
        [self layoutSubviews];
    }
    
    
    
}
-(void)layoutSubviews

{
    
    
    headerImageUrl = _model.avatar;
    
    [image sd_setImageWithURL:[NSURL URLWithString:_model.avatar]];
    namelabel.text = [NSString stringWithFormat:@"%@",_model.userName];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:profileCellId];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 18, 30);
    [leftBtn setImage:[UIImage imageNamed:@"userinside_backwhite"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];

}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.title = @"设置";
    }
    return self;
}
- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
    }
    else if(section == 1)
    {
        return 1;
    }
    else if(section == 2)
    {
        return 1;
    }
    else if(section == 3)
    {
        return 5;
    }
    else
        return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        return 80;
    }
    else if(indexPath.section == 1)
    {
        return 40;
    }
    else if(indexPath.section ==2)
    {
        return 60;
    }else
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:profileCellId forIndexPath:indexPath];
    if(indexPath.section ==0)
    {
        image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        [image sd_setImageWithURL:[NSURL URLWithString:headerImageUrl]];
        image.layer.cornerRadius = 30;
        image.layer.masksToBounds = YES;
        [cell addSubview:image];
        namelabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 200, 20)];
        namelabel.text = [NSString stringWithFormat:@"%@",_model.userName];
        namelabel.textColor = [UIColor blackColor];
        namelabel.font = [UIFont systemFontOfSize:15];
        [cell addSubview:namelabel];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(80, 50, 200, 20)];
        label1.text = @"编辑个人信息";
        label1.textColor = [UIColor colorWithRed:67/255.0 green:146/255.0 blue:221/255.0 alpha:1];
        label1.font = [UIFont systemFontOfSize:12];
        [cell addSubview:label1];
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    else if(indexPath.section ==1)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
        label.text = @"邀请小伙伴";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        [cell addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if(indexPath.section ==2)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
        label.text = @"绑定账户";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        [cell addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
        image1.image = [UIImage imageNamed:@"user_setting_QQ@2x"];
        image1.layer.cornerRadius = 15;
        [cell addSubview:image1];
        UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 25, 30, 30)];
        image2.image = [UIImage imageNamed:@"user_setting_sina@2x"];
        image2.layer.cornerRadius = 15;
        [cell addSubview:image2];
        UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 25, 30, 30)];
        image3.image = [UIImage imageNamed:@"user_setting_wechat@2x"];
        image3.layer.cornerRadius = 15;
        [cell addSubview:image3];
        UIImageView *image4 = [[UIImageView alloc]initWithFrame:CGRectMake(130, 25, 30, 30)];
        image4.image = [UIImage imageNamed:@"user_setting_douban@2x"];
        image4.layer.cornerRadius = 15;
        [cell addSubview:image4];
    }
    else if(indexPath.section ==3)
    {
        if(indexPath.row ==0)
        {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
        label.text = @"清除缓存";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        
        _cacheLabel = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-100, 10, 200, 20)];
        _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB", [self countCacheFileSize]];
        [cell addSubview:_cacheLabel];
        [cell addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else if(indexPath.row ==1)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"当前版本号：3.0.1";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
        }
        else if(indexPath.row ==2)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"关于我们";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else if(indexPath.row ==3)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"给我们评个分";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"静音模式";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
            
            UISwitch *select = [[UISwitch alloc]initWithFrame:CGRectMake(KScreenWidth-70, 5, 60, 30)];
            [select setOn:YES];
            [cell addSubview:select];
        }



            
    }

    else if(indexPath.section ==4)
    {
    if(indexPath.row ==0)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"足记微博";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    else if(indexPath.row ==1)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
            label.text = @"足记微信";
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    else if(indexPath.row ==2)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(30, 5, KScreenWidth-60, 30);
            button.backgroundColor = [UIColor colorWithRed:67/255.0 green:146/255.0 blue:221/255.0 alpha:1];
            button.layer.cornerRadius = 5;
            [cell addSubview:button];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, KScreenWidth-60, 30)];
            label.text = @"退出登录";
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:15];
            [cell addSubview:label];

        }


    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        InformationViewController *inforVC = [[InformationViewController alloc]init];
        [self.navigationController pushViewController:inforVC animated:YES];
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            // 弹出一个提示框
            UIAlertView *alret = [[UIAlertView alloc] initWithTitle:@"警告" message:@"是否要清理缓存" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
            [alret show];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 计算当前缓存文件大小

/**
 *  计算当前应用程序缓存文件的大小之和
 *
 *  @return 文件大小
 */
- (CGFloat)countCacheFileSize
{
    // 1. 获取缓存文件夹的路径
    // 函数，用于获取当前程序的沙盒路径
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@", homePath);
    /**
     1) 子文件夹1 视频缓存 /tmp/MediaCache/
     2）子文件夹2 SDWebImage框架的缓存图片  /Library/Caches/com.hackemist.SDWebImageCache.default/
     3) 子文件夹3 /Library/Caches/wangchengyuan.FootPlace/
     */
    
    // 2. 使用- (CGFloat)getFileSize:(NSString *)filePath 来计算这些文件夹中文件大小
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/wangchengyuan.FootPlace/"];
    // 文件大小之和
    CGFloat fileSize = 0;
    for (NSString *string in pathArray)
    {
        // 拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@", homePath, string];
        fileSize += [self getFileSize:filePath];
        
    }
    
    // 3. 对上一步计算的结果进行求和 并返回
    
    
    return fileSize;
}

/**
 *  根据传入的路径 计算此路径下的文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 此文件夹下所有文件的总大小  单位MB
 */
- (CGFloat)getFileSize:(NSString *)filePath
{
    // 文件管理器对象  单例
    NSFileManager *manager = [NSFileManager defaultManager];
    // 数组 储存文件夹中所有的子文件夹以及文件的名字
    NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
    
    long long size = 0;
    
    // 遍历文件夹
    for (NSString *fileName in fileNames)
    {
        // 拼接获取文件的路径
        NSString *subFilePath = [NSString stringWithFormat:@"%@%@", filePath, fileName];
        // 获取文件信息
        NSDictionary *dic = [manager attributesOfItemAtPath:subFilePath error:nil];
        // 获取单个文件的大小
        NSNumber *sizeNumber = dic[NSFileSize];
        // 使用一个 long long类型来储存文件大小
        long long subFileSize = [sizeNumber longLongValue];
        
        // 文件大小求和
        size += subFileSize;
        
    }
    
    return size / 1024.0 / 1024;
}



#pragma mark - 清理缓存文件

/**
 *  清理缓存文件
 */
- (void)clearCacheFile
{
    _cacheLabel.text = @"清理中.." ;
    // 获取缓存文件的路径
    // 1. 获取缓存文件夹的路径
    
    NSString *homePath = NSHomeDirectory();
    
    
    // 2. 删除文件
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/wangchengyuan.FootPlace/"];
    
    for (NSString *string in pathArray)
    {
        // 拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@", homePath, string];
        // 文件管理
        NSFileManager *manager = [NSFileManager defaultManager];
        // 获取子文件夹中的文件名
        NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
        // 遍历文件夹 删除文件
        for (NSString *fileName in fileNames)
        {
            // 拼接子文件路径
            NSString *subFilePath = [NSString stringWithFormat:@"%@%@", filePath, fileName];
            // 删除文件
            [manager removeItemAtPath:subFilePath error:nil];
        }
        
    }
    
    
    // 重新计算缓存文件大小
    // 将计算完成的结果 显示到界面上去
    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB", [self countCacheFileSize]];
    
}

// 提示框的按钮点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 判断 点击的按钮为 “是”
    if (buttonIndex == 1)
    {
        // 清理缓存
        [self clearCacheFile];
    }
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
