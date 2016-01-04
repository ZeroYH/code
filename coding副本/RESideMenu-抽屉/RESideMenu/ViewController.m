//
//  ViewController.m
//  RESideMenu
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "ViewController.h"
#import "RESideMenu.h"
#import "FirstViewController.h"
#import "BackViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"店家" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goTo:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
   
    
}


     
- (void)goTo:(UIButton *)sender{
    FirstViewController * fir = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:fir animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
