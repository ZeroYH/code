//
//  ImageCell.m
//  UI21_UICollectionView
//
//  Created by lanou3g on 15/10/20.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
//        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qa.jpg"]];
//        _imageView.frame = CGRectMake(0, 0, 100, 100);
//        [self addSubview:_imageView];
        [self addCustomView];
    }
    return self;
}


// 添加全部控件
- (void)addCustomView{
    // 创建并初始化
    self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    // 添加到内容视图
    [self.contentView addSubview:_imageView];
    
}





@end
