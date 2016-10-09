//
//  shareViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "shareViewController.h"

@interface shareViewController ()

@end

bool selectedPhoto = 0;

@implementation shareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btn_x.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - btn delegate

- (IBAction)btn_star_action:(id)sender
{
    NSUInteger tagNumber = [sender tag];
    NSUInteger i;
    tagNumber = tagNumber-200;
    for (i=1; i<=tagNumber; i++) {
        UIButton *btn=(UIButton *)[self.view viewWithTag:i+200];
        [btn setImage:[UIImage imageNamed:@"star_light.png"] forState:UIControlStateNormal];
    }
    for(;i<6;i++)
    {
        UIButton *btn=(UIButton *)[self.view viewWithTag:i+200];
        [btn setImage:[UIImage imageNamed:@"star_dark.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)btn_x_action:(id)sender
{
    self.sharePhoto.image=nil;
    _btn_x.hidden = YES;
    _btnO_album.hidden = NO;
    _btnO_takePhoto.hidden = NO;
}

- (IBAction)btn_IG:(id)sender {
}

- (IBAction)btn_FB:(id)sender {
}

- (IBAction)btn_sendCheckIn:(id)sender
{
    NSString *stonekey = [StoneSingleton shareSingletonObject].stoneKey;
    [[StoneSingleton shareSingletonObject].myCollecttion addObject:stonekey];
}

- (IBAction)btn_takePhoto:(id)sender
{
    _btnO_album.hidden = YES;
    _btnO_takePhoto.hidden = YES;
    _btn_x.hidden = NO;

}

- (IBAction)btn_album:(id)sender
{
    UIImagePickerController *controller = [[UIImagePickerController alloc]init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate=self;
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate 

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.sharePhoto.image=image;
    self.sharePhoto.contentMode = UIViewContentModeScaleAspectFit;
    self.sharePhoto.layer.cornerRadius = 8;
    self.sharePhoto.layer.masksToBounds=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    _btnO_album.hidden = YES;
    _btnO_takePhoto.hidden = YES;
    _btn_x.hidden = NO;

    
}
@end
