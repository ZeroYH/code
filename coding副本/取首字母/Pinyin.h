//
//  Pinyin.h
//  芭丫丫
//
//  Created by fengshaobo on 14/12/28.
//  Copyright (c) 2014年 Aruisi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pinyin : NSObject

+ (NSString *)pinyinFirstLetter:(unsigned short)hanzi;


- (NSString *) uppercasePinYinFirstLetter;
- (NSString *) lowercasePinYinFirstLetter;
@end