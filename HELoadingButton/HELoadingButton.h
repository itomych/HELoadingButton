//
//  HELoadingButton.h
//  HELoadingButton
//
//  Created by How Else on 3/7/17.
//  Copyright © 2017 How Else. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HELoadingButtonIndicatorView <NSObject>

- (void)setColor:(UIColor *)color;

- (void)startAnimating;
- (void)stopAnimating;

@end

@interface HELoadingButton : UIButton

@property (nonatomic, readonly, getter=isLoading) BOOL loading;

@property (nonatomic, strong, readonly) UIView<HELoadingButtonIndicatorView> *loadingIndicatorView;

@property (nonatomic, getter=isEnabledWhileLoading) BOOL enabledWhileLoading;

- (Class)loadingIndicatorViewClass;

- (void)startLoading;
- (void)stopLoading;

@end

@interface HELoadingButtonIndicatorView : UIActivityIndicatorView <HELoadingButtonIndicatorView>

@end

NS_ASSUME_NONNULL_END
