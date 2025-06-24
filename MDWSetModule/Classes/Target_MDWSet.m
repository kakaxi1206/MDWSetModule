//
//

#import "Target_MDWSet.h"
#import "MDCSettingVc.h"

@implementation Target_MDWSet

/// 设置视图
/// - Parameter params: 登录VC需要的参数
-(UIViewController *)Action_settingViewController:(NSDictionary *)params{
    
    MDCSettingVc *setVc = [[MDCSettingVc alloc] init];
    setVc.itemArray = params[@"itemArray"];
    setVc.aboutInfo = params[@"aboutInfo"];
    
    return setVc;
}


@end
