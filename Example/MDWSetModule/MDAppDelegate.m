//
//  MDAppDelegate.m
//  MDWSetModule
//
//  Created by Feex@2023eit on 06/24/2025.
//  Copyright (c) 2025 Feex@2023eit. All rights reserved.
//

#import "MDAppDelegate.h"

#import "MDCSettingVc.h"

#import <MDBMarcoModule/MDPublicEnum.h>


@implementation MDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSMutableArray *dataArray = [NSMutableArray array];
        
    NSArray *dataArr1 = @[@{@"title":@"账号与安全",@"type":@(MDSetItemTypeSecurity)},
                          @{@"title":@"帮助与建议",@"type":@(MDSetItemTypeProposal)}];
    
    NSArray *dataArr2 = @[@{@"title":@"注销账号",@"type":@(MDSetItemTypeClose)},
                          @{@"title":@"版本信息",@"type":@(MDSetItemTypeVersion)},
                          @{@"title":@"关于猫嘀嘀",@"type":@(MDSetItemTypeAbout)}];
    
    
    [dataArray addObject:dataArr1];
    [dataArray addObject:dataArr2];
    
    NSDictionary *aboutDic = @{@"about_logo":[UIImage new],@"content":@"猫嘀嘀app是专为贷款经纪人开发的一款展业获客工具，汇聚海量的客户资源，丰富的业内人脉资源，帮助广大经纪人解决资源匮乏的问题。精准、高效、便捷的帮助经纪人发布业务、获取业务信息，让获客更简单！猫嘀嘀app隶属于上海鑫猫科技旗下，上海鑫猫科技作为新型综合信息金融科技服务平台，将持续创新升级、源源不断地为用户输送巨量资源，提供精细化的平台服务，更好的服务每一位经纪人。"};
    
//    UIImage *logoImg = self.aboutInfo[@"about_logo"];
//    
//    //    NSString *content = @"猫嘀嘀app是专为贷款经纪人开发的一款展业获客工具，汇聚海量的客户资源，丰富的业内人脉资源，帮助广大经纪人解决资源匮乏的问题。精准、高效、便捷的帮助经纪人发布业务、获取业务信息，让获客更简单！猫嘀嘀app隶属于上海鑫猫科技旗下，上海鑫猫科技作为新型综合信息金融科技服务平台，将持续创新升级、源源不断地为用户输送巨量资源，提供精细化的平台服务，更好的服务每一位经纪人。";
//        
//    NSString *content = self.aboutInfo[@"content"];
    
    
    MDCSettingVc *loginVC = [[MDCSettingVc alloc] init];
    loginVC.itemArray = dataArray;
    loginVC.aboutInfo = aboutDic;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
