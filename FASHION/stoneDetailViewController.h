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
@interface stoneDetailViewController : UIViewController<YTPlayerViewDelegate , UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;



@end
