//
//  ViewController.m
//  ChartboostBannerTest
//
//  Created by Maciek Czapnik on 01/12/2023.
//

#import "ViewController.h"

#import <ChartboostSDK/Chartboost.h>

@interface ViewController () <CHBBannerDelegate>

@property (strong, nonatomic) CHBBanner *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    NSString *appID = @"";
    NSString *appSignature = @"";
    [super viewDidLoad];
    [Chartboost startWithAppID:appID
                  appSignature:appSignature
                    completion:^(CHBStartError * _Nullable error) {
    }];
}

- (IBAction)showBanner:(UIButton *)sender
{

    NSString *bannerLocation = @"";
    self.banner = [[CHBBanner alloc] initWithSize:CHBBannerSizeStandard location:bannerLocation delegate:self];
    self.banner.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.banner];
    [NSLayoutConstraint activateConstraints:@[[self.banner.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
                                              [self.banner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]]];
    [self.banner showFromViewController:self];
}



@end
