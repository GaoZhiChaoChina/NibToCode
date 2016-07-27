//
//  AutoWriteModeViewController.m
//  XML
//
//  Created by gaozhichao on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AutoWriteModeViewController.h"
#import "FFUtility.h"

@interface AutoWriteModeViewController ()<UITextViewDelegate>
{
    IBOutlet UITextView *_jsonString;
    __weak IBOutlet UIButton *setModeBtn;
}

@end

@implementation AutoWriteModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* json = @"{\n    \"status\": 200,\n    \"message\": \"\",\n    \"dic\": {\n        \"storeId\": \"10039364\",\n        \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n        \"storeName\": \"林清轩（七宝嘉茂店）\",\n        \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n        \"rank\": 4,\n        \"latitude\": 31.170916,\n        \"longitude\": 121.34828,\n        \"storeUrl\": \"\",\n        \"distance\": \"\"\n    },\n    \"data\": [\n        {\n            \"storeId\": \"10039367\",\n            \"picture\": \"T1B8_TBvLT1RCvBVdK\",\n            \"storeName\": \"林清轩（沃尔玛祁连山店）\",\n            \"plazaName\": \"聚丰园路205号 沃尔玛祁连山林清轩1楼\",\n            \"rank\": 4,\n            \"latitude\": 31.322412,\n            \"longitude\": 120.663246,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"2053452\",\n            \"picture\": \"T1GpCTBKZT1RCvBVdK\",\n            \"storeName\": \"林清轩\",\n            \"plazaName\": \"上海江桥万达广场\",\n            \"rank\": 5,\n            \"latitude\": 31.240414,\n            \"longitude\": 121.32512,\n            \"storeUrl\": \"\",\n            \"distance\": \"\",\n            \"icon\": [\n                \"\"\n            ]\n        },\n        {\n            \"storeId\": \"10039194\",\n            \"picture\": \"T1f8VTBy_T1RCvBVdK\",\n            \"storeName\": \"林清轩（上海正大乐城宝山店）\",\n            \"plazaName\": \"宝山区陆翔路111号B1-031a林清轩\",\n            \"rank\": 4,\n            \"latitude\": 31.351044,\n            \"longitude\": 121.37842,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039364\",\n            \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n            \"storeName\": \"林清轩（七宝嘉茂店）\",\n            \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.170916,\n            \"longitude\": 121.34828,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10027755\",\n            \"picture\": \"T1H8KTBgVT1RCvBVdK\",\n            \"storeName\": \"林清轩（中山龙之梦店）\",\n            \"plazaName\": \"上海市长宁区1018号2036室2楼\",\n            \"rank\": 4,\n            \"latitude\": 31.2133,\n            \"longitude\": 121.38762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039365\",\n            \"picture\": \"T1_HKTBTAT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海凯德龙之梦闵行店）\",\n            \"plazaName\": \"沪闵路6088号凯德龙之梦广场B1-44B\",\n            \"rank\": 4,\n            \"latitude\": 31.224522,\n            \"longitude\": 121.422745,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039366\",\n            \"picture\": \"T1T8dTBTJT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海仲盛购物中心店）\",\n            \"plazaName\": \"上海闵行莘庄都市路5001号B1-F32\",\n            \"rank\": 4,\n            \"latitude\": 31.113111,\n            \"longitude\": 121.39443,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039195\",\n            \"picture\": \"T1F8KTBKCT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海宝山宝龙城市广场店）\",\n            \"plazaName\": \"杨南路2211号M1-1F-064\",\n            \"rank\": 4,\n            \"latitude\": 31.321033,\n            \"longitude\": 121.47497,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039363\",\n            \"picture\": \"T138bTBmJT1RCvBVdK\",\n            \"storeName\": \"林清轩（百联南方店）\",\n            \"plazaName\": \"沪闵路7388号百联南方购物中心1楼林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.137379,\n            \"longitude\": 121.40762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039358\",\n            \"picture\": \"T1b8CTBKKT1RCvBVdK\",\n            \"storeName\": \"林清轩（好又多田林店）\",\n            \"plazaName\": \"徐汇区桂林路402号（田林路桂林路）林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.176998,\n            \"longitude\": 121.423584,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        }\n    ],\n    \"msg\": \"成功\"\n}";
    
    [[FFUtility sharedFFUtility] setName:@"MyViewMode"  setJsonData:json];
    
  
}
- (IBAction)setModeButton:(UIButton *)sender {
    
    NSString* json = @"{\n    \"status\": 200,\n    \"message\": \"\",\n    \"dic\": {\n        \"storeId\": \"10039364\",\n        \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n        \"storeName\": \"林清轩（七宝嘉茂店）\",\n        \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n        \"rank\": 4,\n        \"latitude\": 31.170916,\n        \"longitude\": 121.34828,\n        \"storeUrl\": \"\",\n        \"distance\": \"\"\n    },\n    \"data\": [\n        {\n            \"storeId\": \"10039367\",\n            \"picture\": \"T1B8_TBvLT1RCvBVdK\",\n            \"storeName\": \"林清轩（沃尔玛祁连山店）\",\n            \"plazaName\": \"聚丰园路205号 沃尔玛祁连山林清轩1楼\",\n            \"rank\": 4,\n            \"latitude\": 31.322412,\n            \"longitude\": 120.663246,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"2053452\",\n            \"picture\": \"T1GpCTBKZT1RCvBVdK\",\n            \"storeName\": \"林清轩\",\n            \"plazaName\": \"上海江桥万达广场\",\n            \"rank\": 5,\n            \"latitude\": 31.240414,\n            \"longitude\": 121.32512,\n            \"storeUrl\": \"\",\n            \"distance\": \"\",\n            \"icon\": [\n                \"\"\n            ]\n        },\n        {\n            \"storeId\": \"10039194\",\n            \"picture\": \"T1f8VTBy_T1RCvBVdK\",\n            \"storeName\": \"林清轩（上海正大乐城宝山店）\",\n            \"plazaName\": \"宝山区陆翔路111号B1-031a林清轩\",\n            \"rank\": 4,\n            \"latitude\": 31.351044,\n            \"longitude\": 121.37842,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039364\",\n            \"picture\": \"T1b8_TBKYT1RCvBVdK\",\n            \"storeName\": \"林清轩（七宝嘉茂店）\",\n            \"plazaName\": \"七莘路3655号七宝嘉茂购物广场林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.170916,\n            \"longitude\": 121.34828,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10027755\",\n            \"picture\": \"T1H8KTBgVT1RCvBVdK\",\n            \"storeName\": \"林清轩（中山龙之梦店）\",\n            \"plazaName\": \"上海市长宁区1018号2036室2楼\",\n            \"rank\": 4,\n            \"latitude\": 31.2133,\n            \"longitude\": 121.38762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039365\",\n            \"picture\": \"T1_HKTBTAT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海凯德龙之梦闵行店）\",\n            \"plazaName\": \"沪闵路6088号凯德龙之梦广场B1-44B\",\n            \"rank\": 4,\n            \"latitude\": 31.224522,\n            \"longitude\": 121.422745,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039366\",\n            \"picture\": \"T1T8dTBTJT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海仲盛购物中心店）\",\n            \"plazaName\": \"上海闵行莘庄都市路5001号B1-F32\",\n            \"rank\": 4,\n            \"latitude\": 31.113111,\n            \"longitude\": 121.39443,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039195\",\n            \"picture\": \"T1F8KTBKCT1RCvBVdK\",\n            \"storeName\": \"林清轩（上海宝山宝龙城市广场店）\",\n            \"plazaName\": \"杨南路2211号M1-1F-064\",\n            \"rank\": 4,\n            \"latitude\": 31.321033,\n            \"longitude\": 121.47497,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039363\",\n            \"picture\": \"T138bTBmJT1RCvBVdK\",\n            \"storeName\": \"林清轩（百联南方店）\",\n            \"plazaName\": \"沪闵路7388号百联南方购物中心1楼林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.137379,\n            \"longitude\": 121.40762,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        },\n        {\n            \"storeId\": \"10039358\",\n            \"picture\": \"T1b8CTBKKT1RCvBVdK\",\n            \"storeName\": \"林清轩（好又多田林店）\",\n            \"plazaName\": \"徐汇区桂林路402号（田林路桂林路）林清轩专柜\",\n            \"rank\": 4,\n            \"latitude\": 31.176998,\n            \"longitude\": 121.423584,\n            \"storeUrl\": \"\",\n            \"distance\": \"\"\n        }\n    ],\n    \"msg\": \"成功\"\n}";
    
    [[FFUtility sharedFFUtility] setName:@"MyViewMode"  setJsonData:json];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
