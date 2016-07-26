

#import "GetSBViewController.h"
#import "GetSBTableViewCell.h"
#import "GetXIBTableViewCell.h"
#import "TabBarAndNavagation.h"
#import "ZHFileManager.h"
#import "MBProgressHUD.h"
#import "FFUtility.h"

@interface GetSBViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (weak, nonatomic) IBOutlet UILabel *promoteLabel;

@end

@implementation GetSBViewController


- (NSMutableArray *)dataArr{
	if (!_dataArr) {
		_dataArr=[NSMutableArray array];
	}
	return _dataArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self refreshSB_XIB];
}
- (void)viewDidLoad{
	[super viewDidLoad];
    
    
    
    
    NSString* json = @"{\"status\":200,\"message\":\"\",\"data\":[{\"storeId\":\"10039367\",\"picture\":\"T1B8_TBvLT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u6c83\\u5c14\\u739b\\u7941\\u8fde\\u5c71\\u5e97\\uff09\",\"plazaName\":\"\\u805a\\u4e30\\u56ed\\u8def205\\u53f7 \\u6c83\\u5c14\\u739b\\u7941\\u8fde\\u5c71\\u6797\\u6e05\\u8f691\\u697c\",\"rank\":4,\"latitude\":31.322412,\"longitude\":120.663246,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039367\",\"distance\":\"\"},{\"storeId\":\"2053452\",\"picture\":\"T1GpCTBKZT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\",\"plazaName\":\"\\u4e0a\\u6d77\\u6c5f\\u6865\\u4e07\\u8fbe\\u5e7f\\u573a\",\"rank\":5,\"latitude\":31.240414,\"longitude\":121.32512,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=2053452\",\"distance\":\"\",\"icon\":[\"http:\\/\\/img1.ffan.com\\/T1bzETBbWT1RCvBVdK\"]},{\"storeId\":\"10039194\",\"picture\":\"T1f8VTBy_T1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e0a\\u6d77\\u6b63\\u5927\\u4e50\\u57ce\\u5b9d\\u5c71\\u5e97\\uff09\",\"plazaName\":\"\\u5b9d\\u5c71\\u533a\\u9646\\u7fd4\\u8def111\\u53f7B1-031a\\u6797\\u6e05\\u8f69\",\"rank\":4,\"latitude\":31.351044,\"longitude\":121.37842,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039194\",\"distance\":\"\"},{\"storeId\":\"10039364\",\"picture\":\"T1b8_TBKYT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e03\\u5b9d\\u5609\\u8302\\u5e97\\uff09\",\"plazaName\":\"\\u4e03\\u8398\\u8def3655\\u53f7\\u4e03\\u5b9d\\u5609\\u8302\\u8d2d\\u7269\\u5e7f\\u573a\\u6797\\u6e05\\u8f69\\u4e13\\u67dc\",\"rank\":4,\"latitude\":31.170916,\"longitude\":121.34828,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039364\",\"distance\":\"\"},{\"storeId\":\"10027755\",\"picture\":\"T1H8KTBgVT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e2d\\u5c71\\u9f99\\u4e4b\\u68a6\\u5e97\\uff09\",\"plazaName\":\"\\u4e0a\\u6d77\\u5e02\\u957f\\u5b81\\u533a1018\\u53f72036\\u5ba42\\u697c\",\"rank\":4,\"latitude\":31.2133,\"longitude\":121.38762,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10027755\",\"distance\":\"\"},{\"storeId\":\"10039365\",\"picture\":\"T1_HKTBTAT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e0a\\u6d77\\u51ef\\u5fb7\\u9f99\\u4e4b\\u68a6\\u95f5\\u884c\\u5e97\\uff09\",\"plazaName\":\"\\u6caa\\u95f5\\u8def6088\\u53f7\\u51ef\\u5fb7\\u9f99\\u4e4b\\u68a6\\u5e7f\\u573aB1-44B\",\"rank\":4,\"latitude\":31.224522,\"longitude\":121.422745,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039365\",\"distance\":\"\"},{\"storeId\":\"10039366\",\"picture\":\"T1T8dTBTJT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e0a\\u6d77\\u4ef2\\u76db\\u8d2d\\u7269\\u4e2d\\u5fc3\\u5e97\\uff09\",\"plazaName\":\"\\u4e0a\\u6d77\\u95f5\\u884c\\u8398\\u5e84\\u90fd\\u5e02\\u8def5001\\u53f7B1-F32\",\"rank\":4,\"latitude\":31.113111,\"longitude\":121.39443,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039366\",\"distance\":\"\"},{\"storeId\":\"10039195\",\"picture\":\"T1F8KTBKCT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u4e0a\\u6d77\\u5b9d\\u5c71\\u5b9d\\u9f99\\u57ce\\u5e02\\u5e7f\\u573a\\u5e97\\uff09\",\"plazaName\":\"\\u6768\\u5357\\u8def2211\\u53f7M1-1F-064\",\"rank\":4,\"latitude\":31.321033,\"longitude\":121.47497,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039195\",\"distance\":\"\"},{\"storeId\":\"10039363\",\"picture\":\"T138bTBmJT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u767e\\u8054\\u5357\\u65b9\\u5e97\\uff09\",\"plazaName\":\"\\u6caa\\u95f5\\u8def7388\\u53f7\\u767e\\u8054\\u5357\\u65b9\\u8d2d\\u7269\\u4e2d\\u5fc31\\u697c\\u6797\\u6e05\\u8f69\\u4e13\\u67dc\",\"rank\":4,\"latitude\":31.137379,\"longitude\":121.40762,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039363\",\"distance\":\"\"},{\"storeId\":\"10039358\",\"picture\":\"T1b8CTBKKT1RCvBVdK\",\"storeName\":\"\\u6797\\u6e05\\u8f69\\uff08\\u597d\\u53c8\\u591a\\u7530\\u6797\\u5e97\\uff09\",\"plazaName\":\"\\u5f90\\u6c47\\u533a\\u6842\\u6797\\u8def402\\u53f7\\uff08\\u7530\\u6797\\u8def\\u6842\\u6797\\u8def\\uff09\\u6797\\u6e05\\u8f69\\u4e13\\u67dc\",\"rank\":4,\"latitude\":31.176998,\"longitude\":121.423584,\"storeUrl\":\"http:\\/\\/h5.ffan.com\\/app\\/merchant?storeid=10039358\",\"distance\":\"\"}],\"msg\":\"\\u6210\\u529f\"}";
    
    [[FFUtility sharedFFUtility] setName:@"MyViewMode"  setJsonData:json];
    
    
    
    
    
    
	self.tableView.delegate=self;
	self.tableView.dataSource=self;
    self.tableView.tableFooterView=[UIView new];
	self.edgesForExtendedLayout=UIRectEdgeNone;
    
    [TabBarAndNavagation setRightBarButtonItemTitle:@"刷新" TintColor:[UIColor blackColor] target:self action:@selector(refreshSB_XIB)];
    [TabBarAndNavagation setTitleColor:[UIColor blackColor] forNavagationBar:self];
    self.title=@"SB XIB 生成Masonry";
    
    [self loadData];
}

- (void)refreshSB_XIB{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"正在寻找桌面上的StroyBoard和Xib文件!";
    [self loadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
    
}

- (void)loadData{
    [self.dataArr removeAllObjects];
    
    NSString *mainPath=[ZHFileManager getMacHomeDirectorInIOS];
    mainPath=[mainPath stringByAppendingPathComponent:@"Desktop"];
    
    if ([ZHFileManager fileExistsAtPath:mainPath]==NO) {
        return;
    }
    
    NSArray *filesArr=[ZHFileManager contentsOfDirectoryAtPath:mainPath];
    
    NSMutableArray *filesXIB=[NSMutableArray array];
    NSMutableArray *filesSB=[NSMutableArray array];
    
    for (NSString *filePath in filesArr) {
        if ([filePath hasSuffix:@".xib"]) {
            GetXIBCellModel *GetXIBModel=[GetXIBCellModel new];
            GetXIBModel.title=filePath;
            GetXIBModel.filePath=[mainPath stringByAppendingPathComponent:filePath];
            GetXIBModel.iconImageName=@"xib.png";
            [filesXIB addObject:GetXIBModel];
        }else if ([filePath hasSuffix:@"storyboard"]){
            GetSBCellModel *GetSBModel=[GetSBCellModel new];
            GetSBModel.filePath=[mainPath stringByAppendingPathComponent:filePath];
            GetSBModel.title=filePath;
            GetSBModel.iconImageName=@"sb.png";
            [filesSB addObject:GetSBModel];
        }
    }
    
    if (filesSB.count==0&&filesXIB.count==0) {
        self.promoteLabel.text=@"桌面上没有StroyBoard 和xib 文件";
        self.promoteLabel.backgroundColor=[UIColor redColor];
    }else{
        self.promoteLabel.text=@"数据来源于桌面,StroyBoard 和xib 文件";
        self.promoteLabel.backgroundColor=[UIColor grayColor];
    }
    
    if (filesSB.count==0) {
        GetSBCellModel *GetSBModel=[GetSBCellModel new];
        GetSBModel.title=@"桌面无StroyBoard文件";
        GetSBModel.iconImageName=@"sb.png";
        GetSBModel.noFile=YES;
        [filesSB addObject:GetSBModel];
    }
    if (filesXIB.count==0) {
        GetXIBCellModel *GetXIBModel=[GetXIBCellModel new];
        GetXIBModel.title=@"桌面无Xib文件";
        GetXIBModel.iconImageName=@"xib.png";
        GetXIBModel.noFile=YES;
        [filesXIB addObject:GetXIBModel];
    }
    
    [self.dataArr addObject:filesSB];
    [self.dataArr addObject:filesXIB];
    
    [self.tableView reloadData];
}
#pragma mark - 必须实现的方法:
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.dataArr[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	id modelObjct=self.dataArr[indexPath.section][indexPath.row];
	if ([modelObjct isKindOfClass:[GetSBCellModel class]]){
		GetSBTableViewCell *GetSBCell=[tableView dequeueReusableCellWithIdentifier:@"GetSBTableViewCell"];
		GetSBCellModel *model=modelObjct;
		[GetSBCell refreshUI:model];
		return GetSBCell;
	}
	if ([modelObjct isKindOfClass:[GetXIBCellModel class]]){
		GetXIBTableViewCell *GetXIBCell=[tableView dequeueReusableCellWithIdentifier:@"GetXIBTableViewCell"];
		GetXIBCellModel *model=modelObjct;
		[GetXIBCell refreshUI:model];
		return GetXIBCell;
	}
	//随便给一个cell
	UITableViewCell *cell=[UITableViewCell new];
	return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSLog(@"选择了某一行");
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"storyboard";
    }else if (section==1){
        return @"xib";
    }
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
@end