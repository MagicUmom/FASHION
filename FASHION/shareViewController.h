//
//  shareViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoneSingleton.h"
@interface shareViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *sharePhoto;
@property (weak, nonatomic) IBOutlet UITextView *shareText;
- (IBAction)btn_star_action:(id)sender;
- (IBAction)btn_x_action:(id)sender;
- (IBAction)btn_IG:(id)sender;
- (IBAction)btn_FB:(id)sender;
- (IBAction)btn_sendCheckIn:(id)sender;
- (IBAction)btn_takePhoto:(id)sender;
- (IBAction)btn_album:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnO_takePhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnO_album;
@property (weak, nonatomic) IBOutlet UIButton *btn_x;

@end
