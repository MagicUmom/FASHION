//
//  stoneDetailViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "stoneDetailViewController.h"
#define kOFFSET_FOR_KEYBOARD 80.0

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
    [_detailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _detailTableView.allowsSelection=NO;
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_chat"]];
    [tempImageView setFrame:_detailTableView.frame];
    _detailTableView.backgroundView = tempImageView;
    
    _label_stoneTitle.text = [StoneSingleton shareSingletonObject].stoneName;
    _label_stoneTitle.backgroundColor = [UIColor clearColor];

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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [tableView fd_heightForCellWithIdentifier:@"MyCellIdentifier" configuration:^(id cell){}];
    return 200; // 可在 XIB 檔案，點選 My Talbe View Cell 從 Size inspector 得知
}

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
    cell.backgroundColor=[UIColor clearColor];
    cell.backgroundView = [UIView new];
    cell.selectedBackgroundView = [UIView new];

    /*
     switch ((indexPath.row%4)) {
     case 1:
     cell.mImageView.image = [UIImage imageNamed:@"icon_chrome.png"];
     break;
     case 2:
     cell.mImageView.image = [UIImage imageNamed:@"icon_firefox.png"];
     break;
     case 3:
     cell.mImageView.image = [UIImage imageNamed:@"icon_safari.png"];
     break;
     default:
     cell.mImageView.image = [UIImage imageNamed:@"icon_ie.png"];
     break;
     }
     */
    return cell;
}

#pragma mark - btn delegate

- (IBAction)btn_goLastPage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_checkIn:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"APP想取得您的FB資訊" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self performSegueWithIdentifier:@"segueCheckIn" sender:nil];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - view & keyboard

-(void)keyboardWillShow {
    // Animate the current view out of the way
    NSLog(@"keyboardwillshow");
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    NSLog(@"keyboardwillhide");

    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    //if ([sender isEqual:mailTf])
    //{
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    //}
}
//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

@end
