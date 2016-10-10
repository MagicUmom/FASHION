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
@interface mainMapViewController : UIViewController <GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageBar_background;
@property (weak, nonatomic) IBOutlet UIImageView *imageBar_bus;
@property (weak, nonatomic) IBOutlet UILabel *imageBar_text;

@property (strong, nonatomic) IBOutlet UIView *uiView_map;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;


@end
