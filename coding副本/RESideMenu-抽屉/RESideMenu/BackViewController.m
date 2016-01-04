//
//  BackViewController.m
//  RESideMenu
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "BackViewController.h"
#import "FirstViewController.h"

@interface BackViewController ()

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qa1.jpg"]];
    image.frame = CGRectMake(50, 100, 150, 150);
    [self.view addSubview:image];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"hee " forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(event:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(50, 300, 100, 30);
    [self.view addSubview:btn];
}

- (void)event:(UIButton *)sender{
    FirstViewController * fir = [[FirstViewController alloc] init];
    fir.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self showViewController:fir sender:nil];
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
