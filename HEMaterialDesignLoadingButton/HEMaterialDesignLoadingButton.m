//
//  HEMaterialDesignLoadingButton.m
//  HELoadingButton
//
//  Created by How Else on 4/4/17.
//  Copyright © 2017 How Else. All rights reserved.
//

#import "HEMaterialDesignLoadingButton.h"
#import <MMMaterialDesignSpinner/MMMaterialDesignSpinner.h>

@interface HEMaterialDesignLoadingButtonSpinner : MMMaterialDesignSpinner <HELoadingButtonIndicatorView>

@end

@implementation HEMaterialDesignLoadingButtonSpinner

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 20, 20);
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    self.tintColor = color;
}

@end

@implementation HEMaterialDesignLoadingButton

- (Class)loadingIndicatorViewClass {
    return [HEMaterialDesignLoadingButtonSpinner class];
}

@end
