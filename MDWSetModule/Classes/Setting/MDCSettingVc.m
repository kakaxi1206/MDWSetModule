//
//  MDCSettingVc.m
//  MDClient
//
//  Created by admin on 2025/4/25.
//

#import "MDCSettingVc.h"

#import <MDBMethodExtendModule/UIColor+MDExtend.h>

#import <MDBMarcoModule/MDPublicEnum.h>
#import <MDBMarcoModule/MDGeneralMacro.h>
#import <MDBMethodExtendModule/UIColor+MDExtend.h>
#import <MDBMethodExtendModule/UITextField+MDExtend.h>
#import <MDBMethodExtendModule/UIView+AZGradient.h>
#import <MDBMethodExtendModule/UILabel+MDExtend.h>
#import <MDBMethodExtendModule/NSString+MDExtend.h>
#import <MDBMethodExtendModule/UIButton+Extend.h>

#import <MDBNetWorkModule/MDNetWorkTool.h>

#import <MDProgressHUD/ECMBProgressHUD.h>

#import <Masonry/Masonry.h>

#import "MDCSettingCell.h"

#import "MDCAboutVc.h"

static NSString *MDCSettingCellID = @"MDCSettingCellID";

@interface MDCSettingVc ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataArray;

@property (nonatomic, strong)UIButton *logoutBtn;

@end

@implementation MDCSettingVc


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置";
    [self _createUI];
    

    [self.tableView reloadData];
    
    
    [self _netAppVerson];
}


#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.itemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rows = self.dataArray[section];
    return rows.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MDCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:MDCSettingCellID forIndexPath:indexPath];
    cell.dataDict = self.dataArray[indexPath.section][indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataDict = self.dataArray[indexPath.section][indexPath.row];

    NSString *className = dataDict[@"className"];

    if (className.length>0) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        
        MDSetItemType type = [dataDict[@"type"] intValue];
        if (type == MDSetItemTypeAbout) {

            MDCAboutVc * aboutVc = (MDCAboutVc *)vc;
            aboutVc.aboutInfo = self.aboutInfo;
            [self.navigationController pushViewController:aboutVc animated:YES];
            
        }else{
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
    return 12;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *safetyView = [UIView new];
    safetyView.backgroundColor = kHexColor(@"#F6F6F7");
    return safetyView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeMake(kScreenWidth - 24, 55);
    MDCSettingCell *lcell = (MDCSettingCell *)cell;
    
    
    NSArray *dataArray = self.dataArray[indexPath.section];
    
    if (dataArray.count == 1) {
        [lcell setBgViewCorner:MDCViewCornerTypeAll size:size];
        return;
    }

    if (indexPath.row == 0) {
        [lcell setBgViewCorner:MDCViewCornerTypeTop size:size];
    }else if (indexPath.row == dataArray.count -1){
        [lcell setBgViewCorner:MDCViewCornerTypeBottom size:size];
    }else{
        [lcell setBgViewCorner:MDCViewCornerTypeNone size:size];
    }
}

#pragma mark - event response
-(void)logoutBtnClick{
    NSLog(@"退出登录");
    [[NSNotificationCenter defaultCenter] postNotificationName:kMDLoginStateChangedNotificationName object:nil];
}

#pragma mark - private mehtods
-(void)_createUI{
    
    self.view.backgroundColor = kHexColor(@"#F6F6F7");
    
    [self.view addSubview:self.tableView];
}


- (void)_netAppVerson{
    
    
    __weak typeof(self) weakSelf = self;
    [MDNetWorkTool getWithURL:@"api-user/user/appVersion/checkVersion" scene:MDRequestSceneOfCCheckVersion parameters:@{}  showLoading:NO success:^(id response) {
        
        
        MDLog(@"_netAppVerson:%@",response);
        
        if ([response[@"resp_code"] integerValue] == 0) {
            
            NSString *versionNOStr = [NSString stringWithFormat:@"%@",response[@"datas"][@"versionNo"]];
            NSString* curtVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
            
            if( [curtVersion compare:versionNOStr] != NSOrderedSame && [curtVersion compare:versionNOStr] != NSOrderedDescending ){
                
                for (NSArray *items in weakSelf.dataArray) {
                    for (NSMutableDictionary *item in items) {
                        if ([item[@"type"] intValue] == MDSetItemTypeVersion) {
                            [item setObject:@"去升级" forKey:@"detail"];
                            [weakSelf.tableView reloadData];
                            break;
                        }
                    }
                }
            }
           
        }
    } failure:^(NSError *error) {
        
    }];
    
    
    
}

#pragma mark - getter & setter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,kNavBarHeight,kScreenWidth,kScreenHeight-kNavBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor =  [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 54;
        _tableView.scrollEnabled = NO;
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
        footerView.backgroundColor =  [UIColor clearColor];
        [footerView addSubview:self.logoutBtn];
        [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(12);
            make.right.mas_offset(-12);
            make.bottom.mas_offset(0);
            make.height.mas_equalTo(54);
        }];
        
        _tableView.tableFooterView = footerView;
        
        if (@available(iOS 15.0, *)) {
                   _tableView.sectionHeaderTopPadding = 0; // iOS 15及以上版本可用
               } else {
                   // 对于旧版本iOS，你可能需要手动调整内容偏移量或使用其他技巧来处理顶部间距问题。
               }
        [_tableView registerClass:[MDCSettingCell class] forCellReuseIdentifier:MDCSettingCellID];
    }
    return _tableView;
}



- (UIButton *)logoutBtn{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton configButtonWithTitle:@"安全退出" titleColor:kHexColor(@"#212427") font:MDCRegularFontWithSize(16)];
        _logoutBtn.backgroundColor = [UIColor whiteColor];
        _logoutBtn.layer.cornerRadius = 8;
        [_logoutBtn addTarget:self action:@selector(logoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    
    self.dataArray = [NSMutableArray array];
    
    for (NSArray *items in itemArray) {
        
        NSMutableArray *newItems = [NSMutableArray array];
        for (NSDictionary *dic in items) {
            NSMutableDictionary *newItem = [NSMutableDictionary dictionaryWithDictionary:dic];
            
            NSString *className = @"";
            NSString *icon = @"";
            NSString *subTitle = @"";
            NSString *detail = @"";
            
            MDSetItemType type = [dic[@"type"] intValue];
            switch (type) {
                case MDSetItemTypeSecurity:
                {
                    className = @"MDCAccountSecurityVc";
                    icon = @"set_password";
                    detail = @"已保护";
                }
                    break;
                case MDSetItemTypeProposal:
                {
                    className = @"MDCProposalVc";
                    icon = @"set_edit";
                }
                    break;
                case MDSetItemTypeClose:
                {
                    className = @"MDCCloseAccountVc";
                    icon = @"set_power";
                }
                    break;
                case MDSetItemTypeVersion:
                {
                    className = @"";
                    icon = @"set_version";
                    subTitle =[NSString stringWithFormat:@"(当前版本V%@)",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
                }
                    break;
                case MDSetItemTypeAbout:
                {
                    className = @"MDCAboutVc";
                    icon = @"set_info";
                }
                    break;
                    
                default:
                    break;
            }
            
            [newItem setObject:className forKey:@"className"];
            [newItem setObject:icon forKey:@"icon"];
            [newItem setObject:subTitle forKey:@"subTitle"];
            [newItem setObject:detail forKey:@"detail"];
            
            [newItems addObject:newItem];
        }
        
        [self.dataArray addObject:newItems];
        
    }

}



@end
