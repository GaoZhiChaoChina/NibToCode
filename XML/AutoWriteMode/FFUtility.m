//
//  FFUtility.m
//  Cloud
//
//  Created by gaozhichao on 16/7/18.
//  Copyright © 2016年 gaozhichao. All rights reserved.
//

#import "FFUtility.h"
#import "ZHFileManager.h"



@interface FFUtility ()
// 拼接属性字符串代码
@property (nonatomic , strong)  NSMutableString *string_h ;
@property (nonatomic , strong)  NSMutableString *string_m ;

@end

@implementation FFUtility

+ (instancetype)sharedFFUtility{
    
    static FFUtility* sharedFFUtility= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFFUtility = [[self alloc] init];
        
    });
    return sharedFFUtility;
}

- (void)setName:(NSString *)string setJsonData:(id)data{
    
    
    _string_h = [[NSMutableString alloc]init];
    _string_m = [[NSMutableString alloc]init];
    
    //.h文件默认处理
    [_string_h appendFormat:@"\n%@\n",@"#import <Foundation/Foundation.h>"];
    NSString *str_h = [NSString stringWithFormat:@"@interface %@ : NSObject",string];
    [_string_h appendFormat:@"\n%@\n",str_h];
    
    //数据处理
    [self yc_jsonValue:data];
    
    
    NSString *basePath=[ZHFileManager getMacHomeDirectorInIOS];
    basePath=[basePath stringByAppendingPathComponent:@"Desktop"];
    
    if ([ZHFileManager fileExistsAtPath:basePath]==NO) {
        return;
    }
    
    //获取文件路径
//    NSString *basePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                               NSUserDomainMask, YES) objectAtIndex:0];
    
    NSLog(@"提示===> 写入的沙盒的文件路径=:\n%@",basePath);
    
//    h文件生成
    NSString *path_h =[basePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.h",string]];
    //创建数据缓冲
    NSMutableData *writer_h = [[NSMutableData alloc] init];
    
    [_string_h appendFormat:@"\n@end\n"];
    //将字符串添加到缓冲中
    [writer_h appendData:[_string_h dataUsingEncoding:NSUTF8StringEncoding]];
    
    [writer_h writeToFile:path_h atomically:YES];
    
    
//    m文件生成
    NSString *path_m =[basePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m",string]];
    
    NSMutableData *writer_m = [[NSMutableData alloc] init];
    
    NSString *str_m = [NSString stringWithFormat:@"@implementation %@",string];
    [_string_m appendFormat:@"\n%@\n",str_m];
    
    [_string_m appendFormat:@"\n@end\n"];
    
    [writer_m appendData:[_string_m dataUsingEncoding:NSUTF8StringEncoding]];
    
    [writer_m writeToFile:path_m atomically:YES];
    
}


#pragma Mark--  图片保存  文件写入，属性解析  begin

- (id)yc_jsonValue:(NSString *)object {
    //把字符串转化为二进制数据
    NSData *data = [object dataUsingEncoding:NSUTF8StringEncoding];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    [self setClassType:result isFirst:YES];
    
    return result;
}

- (void)setClassType:(id)object isFirst:(BOOL)isFirst{
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        [self setDic:object isFirst:isFirst];
        
    }else if ([object isKindOfClass:[NSArray class]]){
        
        [object enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0) {
                [_string_h appendFormat:@"\n%@\n",@"//有可能数组中包含多个相同的字典类型，字段只取的第一个，如果后台返回的字段缺失，会引起声明属性的减少"];
                [self setClassType:obj isFirst:YES];
            }
        }];
    
    }else{
        NSLog(@"警告===> 非数组、非字典类型的数据");
        
    }
}

- (void)setDic:(NSDictionary *)sender isFirst:(BOOL)isFirst{
    
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [sender enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *type;
        if ([obj isKindOfClass:[NSString class]]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:[NSArray class]]){
            type = @"NSArray";
            [self setClassType:obj isFirst:isFirst];
            
        }else if ([obj isKindOfClass:[NSNumber class]]){
            type = @"NSInteger";
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            type = @"NSDictionary";
            [self setDic:obj isFirst:isFirst];
            
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            type = @"BooL";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFdata")]){
            type = @"BooL";
        }else{
            type = @"<空值,请自我判断类型>";
        }
        
        // 属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            
            if ([@"NSInteger"  isEqualToString:type]) {
                str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
            }else{
                str = [NSString stringWithFormat:@"@property (nonatomic, %@) %@ %@%@;",[type isEqualToString:@"NSString"] == YES? @"copy": @"strong",type,[type isEqualToString:@"NSInteger"]== YES? @"": @"*", key];
            }
            
        }else{
            
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
            
        }
        // 每生成属性字符串，就自动换行。
        [_string_h appendFormat:@"\n%@\n",str];
    }];
}
#pragma Mark--  图片保存  文件写入，属性解析  end



#pragma Mark--  图片保存  begin
- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}
#pragma Mark--  图片保存  end


- (UIImage *)imageFromView:(UIView *)theView  atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    UIRectClip(r);
    
    [theView.layer renderInContext:context];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}

@end
