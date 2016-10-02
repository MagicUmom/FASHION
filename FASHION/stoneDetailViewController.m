//
//  stoneDetailViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "stoneDetailViewController.h"

@interface stoneDetailViewController ()

@end

@implementation stoneDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self loadDefaultSetting];
    
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };

    [self.playerView loadWithVideoId:@"M7lc1UVf-VE" playerVars:playerVars];
    self.playerView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YTPlayer delegate

- (void)playerViewDidBecomeReady:(nonnull YTPlayerView *)playerView
{
    [playerView playVideo];
}

#pragma mark - textView delegate
/*
- (void)loadDefaultSetting
{

    [self.stoneDetailText setFont:[UIFont boldSystemFontOfSize:18]];
    [self.stoneDetailText setEditable:NO];
    [self.stoneDetailText setClipsToBounds:YES];
}
*/
@end
