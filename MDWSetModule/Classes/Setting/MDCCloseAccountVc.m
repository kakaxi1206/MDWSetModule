//
//  MDCCloseAccountVc.m
//  MDClient
//
//  Created by admin on 2025/5/9.
//

#import "MDCCloseAccountVc.h"

#import <MDBMethodExtendModule/NSString+MDExtend.h>
#import <MDBMarcoModule/MDGeneralMacro.h>
#import <MDBMarcoModule/MDNetPathHeader.h>

#import "MDCButton.h"


@interface MDCCloseAccountVc ()

@property (nonatomic, strong)MDCButton *closeBtn;

@end

@implementation MDCCloseAccountVc


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createUI];
}


#pragma mark - delegate


#pragma mark - event response
-(void)closeBtnClick{
    

    __weak typeof(self) weakSelf = self;
//    [PaySuccessPopView paySuccessPopViewBlockWithTitle:@"确认要注销当前账号吗?" andLeftBtnTitle:@"取消" andRightBtnTitle:@"确认" andDetailStr:nil block:^(NSInteger index) {
//        if (index == 1) {
//            [weakSelf requestDeleteAccount];
//        }
//    }];
    
}


#pragma mark - private mehtods
-(void)_createUI{
    self.title = @"注销账号";
    
    UIColor *textColor =  [UIColor colorWithRed:33/255.0 green:36/255.0 blue:39/255.0 alpha:1];
    
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = @"注销账号存在以下风险";
    titleLab.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    titleLab.textColor = textColor;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kNavBarHeight+44);
        make.centerX.mas_offset(0);
        make.height.mas_equalTo(25);
    }];
    
    UIImageView *hintImageView = [[UIImageView alloc] init];
    hintImageView.image = [UIImage imageNamed:@"icon_alert"];
    [self.view addSubview:hintImageView];
    [hintImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleLab.mas_centerY);
        make.right.equalTo(titleLab.mas_left).offset(-4);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    
    UIView *infoContent = [[UIView alloc] init];
    infoContent.layer.cornerRadius = 8;
    infoContent.clipsToBounds = YES;
    infoContent.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoContent];
    [infoContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(24);
        make.left.mas_offset(16);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(251);
    }];
    
    
   
    NSString *str = @"清空猫嘀嘀实名认证信息";
    UILabel *tipsLab1 = [self createTipsLabWithText:str superView:infoContent];
    [tipsLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(24);
        make.left.mas_offset(32);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(25);
    }];
    
    
    UIView *circle1 = [self createCircle:infoContent];
    [circle1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(tipsLab1.mas_top).offset(7);
        make.centerY.equalTo(tipsLab1.mas_centerY).offset(0);
        make.left.mas_offset(16);
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
    
    
    NSString *contentStr = @"清空猫嘀嘀相关平台所有信息，包括但不限于个人资料，订单记录，收益提现信息等";
//    NSString *contentStr = @"清空猫嘀嘀相关平台所有信息，包括但不限于个人资料，订单记录，聊天记录等";
   
    
    CGFloat height =   [contentStr contentHeightWithFixWidth:kScreenWidth - 80 withFont:MDCRegularFontWithSize(16.f)];
    UILabel *tipsLab2 = [self createTipsLabWithText:contentStr superView:infoContent];
    tipsLab2.numberOfLines = 0;
    [tipsLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLab1.mas_bottom).offset(20);
        make.left.equalTo(tipsLab1.mas_left).offset(0);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(height);
    }];
    
    
    UIView *circle2 = [self createCircle:infoContent];
    [circle2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLab2.mas_top).offset(5);
        make.left.mas_offset(16);
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
    
    
    
    UILabel *tipsLab3 = [self createTipsLabWithText:@"以上信息均将被删除，不可恢复" superView:infoContent];
    tipsLab3.textColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:8/255.0 alpha:1];
    [tipsLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLab2.mas_bottom).offset(20);
        make.left.equalTo(tipsLab2.mas_left).offset(0);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(20);
    }];
    
    
    
    
    NSString *contentStr4 = @"如若存在以下情况，注销审核无法通过：\n- 尚有进行中的订单\n- 账户余额不为0";
    CGFloat height4 =   [self sizeLineFeedWithText:contentStr4 font:14 textSizeWidht:kScreenWidth - 80];
    UILabel *tipsLab4 = [self createTipsLabWithText:contentStr4 superView:infoContent];
    tipsLab4.numberOfLines = 0;
    [tipsLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLab3.mas_bottom).offset(20);
        make.left.equalTo(tipsLab3.mas_left).offset(0);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(height4);
    }];
    
    
    UIView *circle4 = [self createCircle:infoContent];
    [circle4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLab4.mas_top).offset(9);
        make.left.mas_offset(16);
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
    
    
    
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infoContent.mas_bottom).offset(36);
        make.left.offset(16);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(54);
    }];
    
}

-(UIView *)createCircle:(UIView *)superView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kHexColor(@"#333333");
    view.layer.cornerRadius = 3;
    view.clipsToBounds = YES;
    [superView addSubview:view];
    return view;
}

-(UILabel *)createTipsLabWithText:(NSString *)aText superView:(UIView *)superView{
    UILabel *tipsLab = [[UILabel alloc] init];
    tipsLab.font = [UIFont systemFontOfSize:16];
    tipsLab.textColor =  [UIColor colorWithRed:33/255.0 green:36/255.0 blue:39/255.0 alpha:1];
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:aText];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:4];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [aText length])];
    tipsLab.attributedText = attributedString;
    [superView addSubview:tipsLab];
    return tipsLab;
}

- (CGFloat)sizeLineFeedWithText:(NSString *)text font:(CGFloat)fontSize textSizeWidht:(CGFloat)widht {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, widht, 0)];
    textView.text = text;
    textView.font = [UIFont systemFontOfSize:fontSize];
    CGSize size = CGSizeMake(widht, MAXFLOAT);
    CGSize constraint = [textView sizeThatFits:size];
    return constraint.height;
}

#pragma mark - getter & setter
- (MDCButton *)closeBtn{
    if (!_closeBtn) {
        
        
        _closeBtn = [MDCButton gradientButtonWithTitle:@"申请注销账号" titleColor:[UIColor whiteColor] font:MDCBoldFontWithSize(16.f) colors:@[kHexColor(@"#FFB273"),kHexColor(@"#FF7700")]];
        _closeBtn.layer.cornerRadius = 12;
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

@end
