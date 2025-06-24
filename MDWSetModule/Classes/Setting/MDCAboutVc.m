//
//  MDCAboutVc.m
//  MDClient
//
//  Created by admin on 2025/5/9.
//

#import "MDCAboutVc.h"

#import <MDBMethodExtendModule/UILabel+MDExtend.h>
#import <MDBMarcoModule/MDGeneralMacro.h>
#import <MDBMarcoModule/MDNetPathHeader.h>

@interface MDCAboutVc ()

@end

@implementation MDCAboutVc


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createUI];
}


#pragma mark - delegate


#pragma mark - event response


#pragma mark - private mehtods
-(void)_createUI{
    self.title = @"关于猫嘀嘀";
    
    UIImage *logoImg = self.aboutInfo[@"about_logo"];
    
    //    NSString *content = @"猫嘀嘀app是专为贷款经纪人开发的一款展业获客工具，汇聚海量的客户资源，丰富的业内人脉资源，帮助广大经纪人解决资源匮乏的问题。精准、高效、便捷的帮助经纪人发布业务、获取业务信息，让获客更简单！猫嘀嘀app隶属于上海鑫猫科技旗下，上海鑫猫科技作为新型综合信息金融科技服务平台，将持续创新升级、源源不断地为用户输送巨量资源，提供精细化的平台服务，更好的服务每一位经纪人。";
        
    NSString *content = self.aboutInfo[@"content"];
    
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:logoImg];
    [self.view addSubview:logoView];
    logoView.contentMode = UIViewContentModeScaleToFill;
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(48+kNavBarHeight);
        make.size.mas_equalTo(CGSizeMake(77, 121));
    }];
    

    
    UILabel *contentLab = [UILabel configLabelWithText:content Font:MDCRegularFontWithSize(15.f) textAlignment:0 textColor:kHexColor(@"#212427")];
    contentLab.numberOfLines = 0;
    [self.view addSubview:contentLab];
    [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoView.mas_bottom).offset(60);
        make.left.mas_offset(24);
        make.right.mas_offset(-24);
    }];
    
}

#pragma mark - getter & setter


@end
