//
//  HELoadingButton.m
//  HELoadingButton
//
//  Created by How Else on 3/7/17.
//  Copyright © 2017 How Else. All rights reserved.
//

#import "HELoadingButton.h"

@implementation HELoadingButton

@synthesize loading = _loading;
@synthesize loadingIndicatorView = _loadingIndicatorView;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initializeIndicatorView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeIndicatorView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeIndicatorView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    _loadingIndicatorView.center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    [_loadingIndicatorView setColor:self.tintColor];
}

- (Class)loadingIndicatorViewClass {
    return [HELoadingButtonIndicatorView class];
}

- (void)startLoading {
    _loading = YES;
    [_loadingIndicatorView startAnimating];
    [self.titleLabel removeFromSuperview];
    self.enabled = _enabledWhileLoading;
}

- (void)stopLoading {
    _loading = NO;
    [_loadingIndicatorView stopAnimating];
    [self addSubview:self.titleLabel];
    self.enabled = YES;
}

- (void)initializeIndicatorView {
    Class LoadingIndicatorViewClass = [self loadingIndicatorViewClass];
    NSAssert([LoadingIndicatorViewClass isSubclassOfClass:[UIView class]], @"%@ must be a subclass of UIView", LoadingIndicatorViewClass);
    NSAssert([LoadingIndicatorViewClass conformsToProtocol:@protocol(HELoadingButtonIndicatorView)], @"%@ must conform to HELoadingButtonIndicatorView protocol", LoadingIndicatorViewClass);
    UIView<HELoadingButtonIndicatorView> *view = [[LoadingIndicatorViewClass alloc] init];
    _loadingIndicatorView = view;
    view.userInteractionEnabled = NO;
    [self addSubview:view];
    [view setColor:self.tintColor];
}

@end

@implementation HELoadingButtonIndicatorView : UIActivityIndicatorView

@end
