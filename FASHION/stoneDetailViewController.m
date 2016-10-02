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
    [self.detailTableView registerNib:[UINib nibWithNibName:@"detailCell" bundle:nil] forCellReuseIdentifier:@"MyCellIdentifier"];
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
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

#pragma mark - tableview delegate
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}
/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200; // 可在 XIB 檔案，點選 My Talbe View Cell 從 Size inspector 得知
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //if( cell == nil)
    // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"] autorelease];
    //cell.imageView.image = [UIImage imageNamed:@"icon_chrome.png"];
    
    
    detailCell *cell = (detailCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCellIdentifier"];
    cell.detailLabel.text = @"jklasdjilokf   hjsadl  ghnldfs  asdd sad d asd as das asd  asd asd asd  ng jlfdshn glfdjsh lgfd nlfg ";
    cell.detailLabel.numberOfLines=0;
    cell.detailLabel.lineBreakMode=NSLineBreakByWordWrapping;
    [cell.detailLabel sizeToFit];
    cell.detailImage.image =[UIImage imageNamed:@"hello.png"];
    return cell;
}



@end
