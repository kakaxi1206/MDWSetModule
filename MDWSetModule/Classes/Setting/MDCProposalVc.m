//
//  MDCProposalVc.m
//  MDClient
//
//  Created by admin on 2025/5/9.
//

#import "MDCProposalVc.h"
#import <MDBMarcoModule/MDGeneralMacro.h>

#import "PlaceholderTextView.h"

#import <MDBMethodExtendModule/NSString+MDExtend.h>

#import "MDCButton.h"

#import <MDProgressHUD/ECMBProgressHUD.h>

#import <MDBNetWorkModule/MDNetWorkTool.h>

@interface MDCProposalVc ()

@property (nonatomic, strong)PlaceholderTextView *textView;

@property (nonatomic, strong)MDCButton *submitBtn;

@end

@implementation MDCProposalVc


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createUI];
}


#pragma mark - delegate


#pragma mark - event response
-(void)submitBtnClick{
    
    if ([NSString contentIsEmpty:self.textView.currentText]) {
        
        [ECMBProgressHUD showMessageHUDInView:nil message:@"请填写您需要的帮助或您的建议" showTime:1.5];
        
    }else{
        __weak typeof(self) weakSelf = self;
        NSDictionary *dict = @{ @"content":self.textView.currentText};
        
        [MDNetWorkTool getWithURL:@"user-center/personal/saveSuggest" scene:MDRequestSceneOfNormal parameters:dict showLoading:YES success:^(id response) {
            
            [ECMBProgressHUD showMessageHUDInView:nil message:response[@"resp_msg"]  showTime:1.5];
            
            if ([response[@"resp_code"] intValue] == 0) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
            
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    
}

#pragma mark - private mehtods
-(void)_createUI{
    self.title = @"帮助与建议";
    
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kNavBarHeight+16);
        make.left.mas_offset(12);
        make.right.mas_offset(-12);
        make.height.mas_equalTo(200);
    }];
    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom).offset(36);
        make.left.mas_offset(16);
        make.right.mas_offset(-16);
        make.height.mas_equalTo(54);
    }];
}

#pragma mark - getter & setter


- (PlaceholderTextView *)textView{
    
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc] init];
        _textView.font = MDCRegularFontWithSize(16.f);
        _textView.placeholderLabel.text = @"  感谢您对猫嘀嘀的支持，猫嘀嘀的产品会尽快回复您的问题！";
        _textView.placeholderLabel.font = MDCRegularFontWithSize(16.f);
        _textView.backgroundColor = kHexColor(@"F7F7F9");
        _textView.maxLength = 200;  // 输入最大长度
    //    textView.emoticonsDisEnable = YES;  // 是否可输入表情
        _textView.wordNumLabel.text = @"0/200";
        
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.layer.cornerRadius = 12;
        _textView.clipsToBounds = YES;
        
    }
    return _textView;
}

- (MDCButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [MDCButton gradientButtonWithTitle:@"提交" titleColor:[UIColor whiteColor] font:MDCBoldFontWithSize(16.f) colors:@[kHexColor(@"#FFB273"),kHexColor(@"#FF7700")]];
        _submitBtn.layer.cornerRadius = 12;
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

@end
