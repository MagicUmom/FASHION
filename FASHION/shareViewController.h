//
//  shareViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shareViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *sharePhoto;
@property (weak, nonatomic) IBOutlet UITextView *shareText;
@property (weak, nonatomic) IBOutlet UIButton *BTN_upload;
@property (weak, nonatomic) IBOutlet UIButton *BTN_IG;
@property (weak, nonatomic) IBOutlet UIButton *BTN_FB;
@property (weak, nonatomic) IBOutlet UIButton *BTN_finish;

@end
