//
//  MainTabBarController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNaviController.h"

@interface MainTabBarController ()
{
  
    
   
    
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubControllers];
    
    [self creatTabBar];

}

-(void)creatSubControllers{
    
    NSArray *names =@[@"Home",@"Discover",@"Camera",@"Massage",@"Profile"
                      ];
    
    NSMutableArray *naviArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<5; i++) {
        UIStoryboard *stroyBoard = [UIStoryboard storyboardWithName:names[i] bundle:nil];
        
        BaseNaviController *navi = [stroyBoard instantiateInitialViewController];
        
        [naviArray addObject:navi];
                                    
    }
    self.viewControllers = naviArray;
    
    
}
-(void)creatTabBar{
    //移除TabBar
    //获取tabBar
    for (UIView *view in self.tabBar.subviews) {
        Class Cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:Cls]) {
            //移除
            [view removeFromSuperview];
            
        }
    }
    
    CGFloat buttonWidth = KScreenWidth / 5 ;
    
    UIImageView *tabBarBGImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,KScreenWidth , 49)];
    tabBarBGImageView.backgroundColor = [UIColor grayColor];
    [self.tabBar addSubview:tabBarBGImageView];
    
    NSArray *buttonImageNormal = @[@"tabbar_home_normal",
                             @"tabbar_find_normal",
                             @"tabbar_camera",
                             @"tabbar_news_normal",
                             @"tabbar_user_normal"];
    NSArray *buttonImageSelected = @[@"tabbar_home_press",
                             @"tabbar_find_press",
                             @"tabbar_camera",
                             @"tabbar_news_press",
                             @"tabbar_user_press"];
    
    for (int i = 0; i<buttonImageNormal.count; i++) {
        
        if (i == 2) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * i +(buttonWidth-45)/2 ,2, 45, 45)];
            [button setImage:[UIImage imageNamed:buttonImageNormal[i]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:buttonImageSelected[i]] forState:UIControlStateSelected];
            button.tag = i;
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.tabBar addSubview:button];
        }else{
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth *i +(buttonWidth-25)/2 ,(49-25)/2, 25, 25)];
        [button setImage:[UIImage imageNamed:buttonImageNormal[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonImageSelected[i]] forState:UIControlStateSelected];
            button.tag = i;
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        }
    }
    
    
    
}

-(void)buttonAction:(UIButton *)button{
    
    for (UIButton *btn in self.tabBar.subviews) {
         Class Cls = NSClassFromString(@"UIButton");
        if ([btn isKindOfClass:Cls]) {
            btn.selected = NO;
        }
        
        
    }
    
    self.selectedIndex = button.tag;
    
    
    button.selected = YES;
    
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
