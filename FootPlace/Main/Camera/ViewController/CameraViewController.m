//
//  CameraViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
#define movieTextUrl @"http://www.fotoplace.cc/api2/discover/discover_new_subtitles.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&offset=0"

#import "CameraViewController.h"
#import "ShuiYin.h"
#import "MovieViewController.h"
#import "RequestUrlConnection.h"
@interface CameraViewController ()

@end

@implementation CameraViewController
{
     
    UIButton *photo;
    UIButton *camera;
    NSString *str1;
    UIImage *image;
    UIImage *image1;
   
}
-(void)setStr:(NSString *)str
{
    if(_str !=str)
    {
        _str = str;
    }
    //[self imageAction];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(imageAction:) name:@"waterAction" object:nil];
    
//    _image = [[UIImage alloc]init];
    image = [[UIImage alloc]init];
    
    image1 = [[UIImage alloc]init];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 120, KScreenWidth, KScreenHeigth-300)];
    _imageView.backgroundColor = [UIColor darkGrayColor];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [self.view addSubview:_imageView];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 55, 51);
    [rightBtn setTitle:@"字幕" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(movieAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightitem;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 55, 51);
    [leftBtn setTitle:@"发布" forState:UIControlStateNormal];
   
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftitem;

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(76/255.0) green:(75/255.0) blue:(74/255.0) alpha:1];

    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}
     ];

    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth / 2, 32, 30, 20)];
    [commentLabel setText:@"大片"];
    [commentLabel setTextColor:[UIColor whiteColor]];
    commentLabel.font = [UIFont systemFontOfSize:19];
    commentLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = commentLabel;
    
    

    //先设定sourceType为相机，然后判断相机是否可用（ipod）没相机，不可用将sourceType设定为相片库
    [self createSubViews];
    
}

-(void)movieAction:(UIButton *)sender
{
    MovieViewController *vc = [[MovieViewController alloc]init];
    
    [RequestUrlConnection requestWithUrlString:movieTextUrl Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        NSDictionary *data = dic[@"data"];
        
        vc.movieTextArray = data[@"subtitles"];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
  //  [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)createSubViews
{
    photo = [[UIButton alloc]initWithFrame:CGRectMake(50, (KScreenHeigth-70-49), 100, 50)];
    photo.layer.cornerRadius =10;
   
    [photo setTitle:@"相册" forState:UIControlStateNormal];
    photo.backgroundColor = [UIColor blackColor];
    [photo addTarget:self action:@selector(photoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photo];
    camera = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-150, (KScreenHeigth-70-49), 100, 50)];
    camera.layer.cornerRadius =10;
    [camera setTitle:@"摄像头" forState:UIControlStateNormal];
    camera.backgroundColor = [UIColor blackColor];
    [camera addTarget:self action:@selector(cameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:camera];
    
}
-(void)photoAction:(UIButton *)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
//    sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
  //  [self presentModalViewController:picker animated:YES];//进入照相界面
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"进入相册");
    }];
    
}
-(void)cameraAction:(UIButton *)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
        sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
//    sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    //[self presentModalViewController:picker animated:YES];//进入照相界面
    
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"进入相机");
    }];
}
#pragma mark - UIImagePickerController 代理方法


//监听事件被选择的事件
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
  
    image = info[UIImagePickerControllerOriginalImage];
    
    //image = [ShuiYin watermaskimage:image text:@"124121"];
    _imageView.image = image;
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        
        //图片的保存
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
//图片保存成功调用的协议方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo {
    
    NSLog(@"保存成功");
}

-(void)imageAction:(NSNotification *)sender{
    NSDictionary *dic = sender.userInfo;
    
    NSString *CNtext = dic[@"CNText"];
    NSString *Entext = dic[@"ENText"];
     image1 = image;
    image1 = [ShuiYin watermaskimage:image1 text:CNtext ENtext:Entext];
    _imageView.image = image1;

    
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
