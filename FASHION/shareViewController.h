//
//  shareViewController.h
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shareViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *sharePhoto;
@property (weak, nonatomic) IBOutlet UITextView *shareText;
- (IBAction)btn_selectPhoto:(id)sender;
- (IBAction)btn_IG:(id)sender;
- (IBAction)btn_FB:(id)sender;
- (IBAction)btn_sendCheckIn:(id)sender;

@end
