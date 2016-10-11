//
//  mainMapViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "StoneSingleton.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "SDCycleScrollView.h"

@interface mainMapViewController : UIViewController <GMSMapViewDelegate,SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageBar_background;
@property (weak, nonatomic) IBOutlet UIImageView *imageBar_bus;
@property (weak, nonatomic) IBOutlet UILabel *imageBar_text;
- (IBAction)btn_hot:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *out_btn_hot;
- (IBAction)btn_action_mylocation:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *uiView_map;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;

@property (weak, nonatomic) IBOutlet UIImageView *imageBar_line;
@property (nonatomic, strong) IBOutlet SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) IBOutlet UIView *view_forSDCycleScroll;

@end
