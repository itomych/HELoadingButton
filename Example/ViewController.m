//
//  ViewController.m
//  Example
//
//  Created by How Else on 3/7/17.
//  Copyright © 2017 How Else. All rights reserved.
//

#import "ViewController.h"
#import "HELoadingButton.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet HELoadingButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HELoadingButton *button = [HELoadingButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 300, 90);
    button.enabledWhileLoading = YES;
    [button setTitle:@"Test" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (IBAction)loadingButtonAction:(HELoadingButton *)button {
    if (button != self.button && self.button.isLoading) {
        [self.button stopLoading];
    }
    if (button.isLoading) {
        [button stopLoading];
    } else {
        [button startLoading];
    }
}

@end
