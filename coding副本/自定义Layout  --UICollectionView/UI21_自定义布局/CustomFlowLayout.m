//
//  CustomFlowLayout.m
//  UI21_自定义布局
//
//  Created by lanou3g on 15/10/20.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "CustomFlowLayout.h"

#define kItem 100

@implementation CustomFlowLayout


// 将要开始布局
// 一些初始化工作
- (void)prepareLayout{
    // 设置大小
    self.itemSize = CGSizeMake(kItem, kItem);
    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置最小行间距
    self.minimumLineSpacing = 50;
    // 设置左右边距
    CGFloat inset = (self.collectionView.frame.size.width - kItem) * 0.5;
    // 设置内边距
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}

// 是否时刻改变并重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
// 这个数组里放置的是每一个item的设置属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 从父类里面获取item设置属性的数组
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    // 获取屏幕的中心点
    CGFloat centerX = self.collectionView.frame.size.width * 0.5 + self.collectionView.contentOffset.x;
    // 遍历
    for (UICollectionViewLayoutAttributes * attrs in array) {
        // item 的中心点
        CGFloat itemCenterX = attrs.center.x;
        // 缩放比例 (ABS(A) 取一个数的绝对值)
        CGFloat scale = 1 + 0.5 * (1 -ABS(itemCenterX - centerX) / 200);
        // 开始缩放 transform3D 3D效果
        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1);
    }
    return array;
}



@end
