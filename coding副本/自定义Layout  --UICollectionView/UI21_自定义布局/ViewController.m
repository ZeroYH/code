//
//  ViewController.m
//  UI21_自定义布局
//
//  Created by lanou3g on 15/10/20.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "CustomFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

static NSString * identifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 瀑布流
    // 系统
//    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //
    CustomFlowLayout * flowLayout = [[CustomFlowLayout alloc] init];
    
    
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200) collectionViewLayout:flowLayout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //collectionView.backgroundColor = [UIColor redColor];
    
    
    [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:collectionView];
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSLog(@"sda");
    cell.imageView.image = [UIImage imageNamed:@"qa.jpg"];
    return cell;
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
