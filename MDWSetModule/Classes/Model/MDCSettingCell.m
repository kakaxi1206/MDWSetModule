//
//  MDCSettingCell.m
//  MDClient
//
//  Created by admin on 2025/4/25.
//

#import "MDCSettingCell.h"

#import <MDBMethodExtendModule/UIImage+MDExtend.h>

#import <MDBMethodExtendModule/UIColor+MDExtend.h>

#import <MDBMarcoModule/MDGeneralMacro.h>

#import <MDBMethodExtendModule/UIColor+MDExtend.h>
#import <MDBMethodExtendModule/UITextField+MDExtend.h>
#import <MDBMethodExtendModule/UIView+AZGradient.h>
#import <MDBMethodExtendModule/UILabel+MDExtend.h>
#import <MDBMethodExtendModule/NSString+MDExtend.h>
#import <Masonry/Masonry.h>

#import <MDProgressHUD/ECMBProgressHUD.h>

#import <MDBMethodExtendModule/UIButton+Extend.h>

#import <MDBNetWorkModule/MDNetWorkTool.h>

@interface MDCSettingCell()

@property (nonatomic, strong)UILabel *titleLab;

@property (nonatomic, strong)UILabel *subTitleLab;

@property (nonatomic, strong)UILabel *detailLab;

@property (nonatomic, strong)UIView *bgView;

@property (nonatomic, strong)UIImageView *iconView;

@property (nonatomic, strong)UIImageView *arrowView;

@end

@implementation MDCSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}


- (void)setDataDict:(NSDictionary *)dataDict{
    _dataDict =  dataDict;
    
    UIImage *image = [UIImage md_imgWithName:dataDict[@"icon"] bundle:@"MDWSetModule" targetClass:[self class]] ;
//    UIImage *image = dataDict[@"icon"];
    self.iconView.image = image;
    self.titleLab.text = dataDict[@"title"];
    
    NSString *subTitle = dataDict[@"subTitle"];
    if (subTitle.length>0) {
        self.subTitleLab.hidden = NO;
        self.subTitleLab.text = subTitle;
    }else{
        self.subTitleLab.text =@"";
        self.subTitleLab.hidden = YES;
        
    }
    
    NSString *detail = dataDict[@"detail"];
    if (detail.length>0) {
        self.detailLab.hidden = NO;
        self.detailLab.text = detail;
        
        if ([detail isEqualToString:@"已保护"]) {
            self.detailLab.textColor = kHexColor(@"#9A9EA1");
        }
        
        
        if ([detail isEqualToString:@"去升级"]) {
            self.detailLab.textColor = kHexColor(@"#069CFF");
        }
        
    }else{
        self.detailLab.text =@"";
        self.detailLab.hidden = YES;
    }
    
}

- (void)setBgViewCorner:(MDCViewCornerType)type size:(CGSize )size{
    
    CGRect boundes = CGRectMake(0, 0, self.bounds.size.width-24,self.bounds.size.height);
    
    self.bgView.layer.mask = [self maskLayerWithCornerType:type boundes:boundes cornerSize:CGSizeMake(8, 8)];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(12);
        make.right.mas_offset(-12);
        make.top.bottom.mas_offset(0);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(16);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(12);
        make.centerY.mas_offset(0);
        make.height.mas_equalTo(22);
    }];
    
    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(12);
        make.centerY.mas_offset(0);
        make.height.mas_equalTo(18);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-8);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowView.mas_left).offset(0);
        make.centerY.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
}

-(void)_createUI{
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    self.iconView = [[UIImageView alloc] init];
    [self.bgView addSubview:self.iconView];
    
    
    self.titleLab = [UILabel configLabelWithFont:MDCRegularFontWithSize(16) textAlignment:0 textColor:kHexColor(@"#212427")];
    [self.bgView addSubview:self.titleLab];
    
    self.subTitleLab = [UILabel configLabelWithFont:MDCRegularFontWithSize(13) textAlignment:0 textColor:kHexColor(@"#9A9EA1")];
    [self.bgView addSubview:self.subTitleLab];
    
    self.detailLab = [UILabel configLabelWithFont:MDCMediumFontWithSize(14) textAlignment:NSTextAlignmentRight textColor:kHexColor(@"#069CFF")];
    [self.bgView addSubview:self.detailLab];
    
    UIImage *image = [UIImage md_imgWithName:@"set_arrow_right" bundle:@"MDWSetModule" targetClass:[self class]] ;
    self.arrowView = [[UIImageView alloc] initWithImage:image];
    [self.bgView addSubview:self.arrowView];
}


@end
