//
//  AppDelegate.m
//  XML
//
//  Created by mac on 16/11/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "FFUtility.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString* json = @"{\n    \"status\": 200,\n    \"message\": \"\",\n    \"dic\": {\n        \"storeId\": \"10039364\",\n        \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n        \"storeName\": \"林清轩（七宝嘉茂店）\",\n        \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n        \"rank\": 4,\n        \"latitude\": 31.170916,\n        \"longitude\": 121.34828,\n        \"storeUrl\": \"\",\n        \"distance\": \"\"\n    },\n    \"data\": [\n        {\n            \"storeId\": \"10039367\",\n            \"picture\": \"T1B8_TBvLT1RCvBVdK\",\n            \"storeName\": \"林清轩（沃尔玛祁连山店）\",\n            \"plazaName\": \"聚丰园路205号 沃尔玛祁连山林清轩1楼\",\n            \"rank\": 4,\n            \"latitude\": 31.322412,\n            \"longitude\": 120.663246,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"2053452\",\n            \"picture\": \"T1GpCTBKZT1RCvBVdK\",\n            \"storeName\": \"林清轩\",\n            \"plazaName\": \"上海江桥万达广场\",\n            \"rank\": 5,\n            \"latitude\": 31.240414,\n            \"longitude\": 121.32512,\n            \"storeUrl\": \"\",\n            \"distance\": \"\",\n            \"icon\": [\n                \"\"\n            ]\n        },\n        {\n            \"storeId\": \"10039194\",\n            \"picture\": \"T1f8VTBy_T1RCvBVdK\",\n            \"storeName\": \"林清轩（上海正大乐城宝山店）\",\n            \"plazaName\": \"宝山区陆翔路111号B1-031a林清轩\",\n            \"rank\": 4,\n            \"latitude\": 31.351044,\n            \"longitude\": 121.37842,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039364\",\n            \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n            \"storeName\": \"林清轩（七宝嘉茂店）\",\n            \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.170916,\n            \"longitude\": 121.34828,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10027755\",\n            \"picture\": \"T1H8KTBgVT1RCvBVdK\",\n            \"storeName\": \"林清轩（中山龙之梦店）\",\n            \"plazaName\": \"上海市长宁区1018号2036室2楼\",\n            \"rank\": 4,\n            \"latitude\": 31.2133,\n            \"longitude\": 121.38762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039365\",\n            \"picture\": \"T1_HKTBTAT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海凯德龙之梦闵行店）\",\n            \"plazaName\": \"沪闵路6088号凯德龙之梦广场B1-44B\",\n            \"rank\": 4,\n            \"latitude\": 31.224522,\n            \"longitude\": 121.422745,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039366\",\n            \"picture\": \"T1T8dTBTJT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海仲盛购物中心店）\",\n            \"plazaName\": \"上海闵行莘庄都市路5001号B1-F32\",\n            \"rank\": 4,\n            \"latitude\": 31.113111,\n            \"longitude\": 121.39443,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039195\",\n            \"picture\": \"T1F8KTBKCT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海宝山宝龙城市广场店）\",\n            \"plazaName\": \"杨南路2211号M1-1F-064\",\n            \"rank\": 4,\n            \"latitude\": 31.321033,\n            \"longitude\": 121.47497,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039363\",\n            \"picture\": \"T138bTBmJT1RCvBVdK\",\n            \"storeName\": \"林清轩（百联南方店）\",\n            \"plazaName\": \"沪闵路7388号百联南方购物中心1楼林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.137379,\n            \"longitude\": 121.40762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039358\",\n            \"picture\": \"T1b8CTBKKT1RCvBVdK\",\n            \"storeName\": \"林清轩（好又多田林店）\",\n            \"plazaName\": \"徐汇区桂林路402号（田林路桂林路）林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.176998,\n            \"longitude\": 121.423584,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        }\n    ],\n    \"msg\": \"成功\"\n}";
    
    [[FFUtility sharedFFUtility] setName:@"MyViewMode"  setJsonData:json];    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
