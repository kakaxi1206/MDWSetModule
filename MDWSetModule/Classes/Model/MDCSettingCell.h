//
//  MDCSettingCell.h
//  MDClient
//
//  Created by admin on 2025/4/25.
//

#import <UIKit/UIKit.h>

#import <MDBMethodExtendModule/UIView+MaskLayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDCSettingCell : UITableViewCell

@property (nonatomic, strong)NSDictionary *dataDict;

- (void)setBgViewCorner:(MDCViewCornerType)type size:(CGSize )size;

@end

NS_ASSUME_NONNULL_END
