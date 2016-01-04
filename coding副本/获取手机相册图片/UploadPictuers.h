//
//  UploadPictuers.h
//  上传图片
//
//  Created by lanou3g on 15/11/15.
//  Copyright © 2015年 MyOClesson.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UploadDelegate <NSObject>

- (void)showImagePicker:(UIImagePickerController *)imagePickerController;

@end

@interface UploadPictuers : NSObject

@property (nonatomic, assign) id<UploadDelegate> delegate;


- (void)imagePicker;
- (void)showImagePicker;
- (UIImage *)imagePickerUploadPictuers;
- (NSString *)imagePickerUploadName;

@end
