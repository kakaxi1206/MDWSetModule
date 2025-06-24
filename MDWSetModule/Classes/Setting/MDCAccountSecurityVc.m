//
//  MDCAccountSecurityVc.m
//  MDClient
//
//  Created by admin on 2025/5/9.
//

#import "MDCAccountSecurityVc.h"

#import <MDBMarcoModule/MDGeneralMacro.h>
#import <MDBMarcoModule/MDNetPathHeader.h>

#import <MDBDataModule/MDCUserDefaultsManager.h>

#import <MDLoginCategory/CTMediator+MDLogin.h>

#import <MDBUIModule/MDCEditInfoCell.h>


#import <MDBDataModule/MDCSetModel.h>



typedef enum : NSUInteger {
    MDCPWDTypeSetPwd=0,/**< 设置密码 */
    MDCPWDTypeChangePwd /**< 修改密码 */
} MDCPWDType;


static NSString *MDCEditInfoCellID = @"MDCEditInfoCellID";

@interface MDCAccountSecurityVc ()

@end

@implementation MDCAccountSecurityVc


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createUI];
    
    [self _configData];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfTableView.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MDCEditInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:MDCEditInfoCellID forIndexPath:indexPath];
    cell.model = self.arrayOfTableView[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    switch (indexPath.row) {
        case 1:
        {
            
            MDCUserInfoModel *infoModel = [MDCUserDefaultsManager getUserInfoModel];
            
            NSInteger type = infoModel.isSetPassword? MDCPWDTypeChangePwd:MDCPWDTypeSetPwd;
            UIViewController *vc =  [[CTMediator sharedInstance] setPWdViewController:@{@"type":@(type)}];

            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - event response


#pragma mark - private mehtods
-(void)_createUI{
    self.title = @"账号与安全";
    
    [self.view addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(12+kNavBarHeight);
        make.left.mas_offset(12);
        make.right.mas_offset(-12);
        make.height.mas_equalTo(108);
    }];
}

-(void)_configData{
    [self.arrayOfTableView removeAllObjects];
    
    MDCUserInfoModel *infoModel = [MDCUserDefaultsManager getUserInfoModel];
    
    
    MDCSetModel *model = [MDCSetModel new];
    model.title = @"手机号";
    model.value = infoModel.username;
    model.isClickable = NO;
    
    
    [self.arrayOfTableView addObject:model];
    
    
    MDCSetModel *modelII = [MDCSetModel new];
    modelII.title = @"登录密码";
    modelII.value = [infoModel.isSetPassword intValue]==1 ?@"修改密码":@"未设置";
    modelII.isClickable = YES;
    [self.arrayOfTableView addObject:modelII];
    
    [self.contentTableView reloadData];
}

#pragma mark - getter & setter
//重写父类contentTableView属性get方法
- (UITableView *)contentTableView{
    UITableView *contentTableView = objc_getAssociatedObject(self, @selector(contentTableView)); // 获取关联对象
    
    if (!contentTableView) {
        // 如果没有设置，返回默认值
    
        contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,kNavBarHeight,kScreenWidth,kScreenHeight-kNavBarHeight) style:UITableViewStylePlain];
        contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        contentTableView.backgroundColor =  [UIColor whiteColor];
        contentTableView.layer.cornerRadius = 8;
        contentTableView.clipsToBounds = YES;
        contentTableView.delegate = self;
        contentTableView.dataSource = self;
        contentTableView.rowHeight = 54;
        contentTableView.scrollEnabled = NO;
        [contentTableView registerClass:[MDCEditInfoCell class] forCellReuseIdentifier:MDCEditInfoCellID];
    

        objc_setAssociatedObject(self, @selector(contentTableView), contentTableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC); // 设置关联对象
    }
    return contentTableView; // 自定义返回格式
    
}

@end
