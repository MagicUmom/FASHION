//
//  stoneDetailViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
#import "detailCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "StoneSingleton.h"

@interface stoneDetailViewController : UIViewController<YTPlayerViewDelegate , UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
- (IBAction)btn_goLastPage:(id)sender;
- (IBAction)btn_checkIn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label_stoneTitle;

- (IBAction)bringMeToThere:(id)sender;


@end
