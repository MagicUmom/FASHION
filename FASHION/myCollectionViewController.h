//
//  myCollectionViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "StoneSingleton.h"

@interface myCollectionViewController : UIViewController<GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *collect_label_count;
@property (strong, nonatomic) IBOutlet UIView *uiView_map;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;

@end
