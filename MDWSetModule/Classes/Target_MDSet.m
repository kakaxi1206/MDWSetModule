//
//

#import "Target_MDSet.h"
#import "MDCSettingVc.h"

@implementation Target_MDSet

/// 返回登录VC
/// - Parameter params: 登录VC需要的参数
-(UIViewController *)Action_loginViewController:(NSDictionary *)params{
    
    MDCSettingVc *setVc = [[MDCSettingVc alloc] init];
    setVc.itemArray = params[@"itemArray"];
    setVc.aboutInfo = params[@"aboutInfo"];
    
    return setVc;
}


@end
