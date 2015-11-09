//
//  InformationViewController.m
//  FootPlace
//
//  Created by imac on 15/10/28.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController{
    UITextField *_nickName;
    UITextField *_location;
    UITextView *_signature;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createNaviBar];
    [self _createSubViews];
}

- (void)_createNaviBar{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 50, 30);
    [rightBtn setTitle:@"上传" forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)_createSubViews{
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 84, KScreenWidth - 10, 60);
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    image.image = [UIImage imageNamed:@"headView.jpg"];
    image.layer.cornerRadius = 20;
    image.layer.masksToBounds = YES;
    [button addSubview:image];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(65, 20, 150, 20)];
    label.text = @"点击更改个人头像";
    label.font = [UIFont systemFontOfSize:13];
    [button addSubview:label];
    
    _nickName = [[UITextField alloc]initWithFrame:CGRectMake(10, 184, KScreenWidth - 10, 50)];
    _nickName.backgroundColor = [UIColor whiteColor];
    _nickName.placeholder = @"dylan";
    UILabel *nickLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 170, 50, 15)];
    nickLabel.text = @"昵称：";
    nickLabel.textColor = [UIColor lightGrayColor];
    nickLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:nickLabel];
    [self.view addSubview:_nickName];
    
    _location = [[UITextField alloc]initWithFrame:CGRectMake(10, 274, KScreenWidth - 10, 50)];
    _location.backgroundColor = [UIColor whiteColor];
    _location.placeholder = @"0,0";
    UILabel *locaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 260, 50, 15)];
    locaLabel.text = @"所在地：";
    locaLabel.textColor = [UIColor lightGrayColor];
    locaLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:locaLabel];
    [self.view addSubview:_location];
    
    _signature = [[UITextView alloc]initWithFrame:CGRectMake(10, 364, KScreenWidth - 10, 150)];
    _signature.backgroundColor = [UIColor whiteColor];
    UILabel *signLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 50, 15)];
    signLabel.text = @"签名：";
    signLabel.textColor = [UIColor lightGrayColor];
    signLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:signLabel];
    [self.view addSubview:_signature];
}

- (void)changeAction{
    NSLog(@"点击");
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍一张",@"从相册选", nil];
    sheet.actionSheetStyle = UIActionSheetStyleDefault;
    [sheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
    UIImagePickerControllerSourceType sourceType;
    //选择相机 或者 相册
    if (buttonIndex == 0) {//拍照
        
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
        }
        
        
    }else if(buttonIndex == 1){ //选择相册
        
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }else{
        
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    //2 取出照片
   // UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
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
