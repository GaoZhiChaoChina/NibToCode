//
//  FFUtility.h
//  Cloud
//
//  Created by gaozhichao on 16/7/18.
//  Copyright © 2016年 gaozhichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FFUtility : NSObject
+ (instancetype)sharedFFUtility;

/**
 *  /自动生成mode文件
 *
 *  @param string 类名
 *  @param data   json数据
 */
- (void)setName:(NSString *)string setJsonData:(id)data;

/**
 *  保存图片到相册
 *
 *  @param savedImage <#savedImage description#>
 */
- (void)saveImageToPhotos:(UIImage*)savedImage;

/**
 *  截取图片
 *
 *  @param theView <#theView description#>
 *  @param r       <#r description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)imageFromView:(UIView *)theView  atFrame:(CGRect)r;
@end
