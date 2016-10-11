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

bool m_click = NO;

@implementation stoneDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self loadDefaultSetting];
    [StoneSingleton shareSingletonObject].toHere = NO ;
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };

    [self.playerView loadWithVideoId:@"C-5NSGX9fmU" playerVars:playerVars];
    self.playerView.delegate = self;
    [self.detailTableView registerNib:[UINib nibWithNibName:@"detailCell" bundle:nil] forCellReuseIdentifier:@"MyCellIdentifier"];
    [_detailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _detailTableView.allowsSelection=NO;
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_chat"]];
    [tempImageView setFrame:_detailTableView.frame];
    _detailTableView.backgroundView = tempImageView;
    
    //_label_stoneTitle.text = [StoneSingleton shareSingletonObject].stoneName;
    _label_stoneTitle.backgroundColor = [UIColor clearColor];
    //_label_stoneTitle.font = [UIFont fontWithName:@"wind" size:24];
    _label_stoneTitle.textColor = [UIColor colorWithRed:(188/255.f) green:(188/255.f) blue:(188/255.f) alpha:1.0];

    _view_w_top.hidden = YES;
    _view_w_bottom.hidden = NO;
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
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [tableView fd_heightForCellWithIdentifier:@"MyCellIdentifier" configuration:^(id cell){}];
    return 400; // 可在 XIB 檔案，點選 My Talbe View Cell 從 Size inspector 得知
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //if( cell == nil)
    // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"] autorelease];
    //cell.imageView.image = [UIImage imageNamed:@"icon_chrome.png"];
    
    
    detailCell *cell = (detailCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCellIdentifier"];
    cell.detailLabel.text = @"    石滬此通辭里下滬建造較晚，在地理位置比下滬更北（遠），所以命名頂滬。此滬建於昭和十二年，填滬時主要以木板釘成筏船，載運石材到石滬預定地，利用漲潮時將石滬慢慢疊砌，修滬原則是，只要倒塌即修，修復人為全部的持有者。當時的建滬人在1997年訪調時，僅林明仕尚存，其他皆已死亡。據了解，該滬若農曆見一、四、七由謝萬順、陳江河二人巡滬；二、五、八由林明同、林明仕巡滬；三、六、九由李在、李螽斯巡滬。如遇到大月的十、二十、三十這三天，則正月由謝萬順這組巡、二月由林明同這組巡，三月就由李在這組來巡，其餘月份類推。 ";
    cell.detailLabel.numberOfLines=0;
    cell.detailLabel.lineBreakMode=NSLineBreakByWordWrapping;
    [cell.detailLabel sizeToFit];
    //cell.detailImage.image =[UIImage imageNamed:@"cell_story.png"];
    cell.backgroundColor=[UIColor clearColor];
    cell.backgroundView = [UIView new];
    cell.selectedBackgroundView = [UIView new];

    return cell;
}

#pragma mark - btn delegate

- (IBAction)bringMeToThere:(id)sender
{
    [StoneSingleton shareSingletonObject].toHere = YES;
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)btn_m:(id)sender
{
    if (m_click)
    {
        UIImageView *tempView = (UIImageView *)[self.view viewWithTag:401];
        tempView.image = [UIImage imageNamed:@"w_num_1"];
        tempView = (UIImageView *)[self.view viewWithTag:402];
        tempView.image = [UIImage imageNamed:@"w_num_2"];
        tempView = (UIImageView *)[self.view viewWithTag:403];
        tempView.image = [UIImage imageNamed:@"w_num_3"];
        tempView = (UIImageView *)[self.view viewWithTag:404];
        tempView.image = [UIImage imageNamed:@"w_num_4"];
        tempView = (UIImageView *)[self.view viewWithTag:411];
        tempView.image = [UIImage imageNamed:@"w_num_5"];
        tempView = (UIImageView *)[self.view viewWithTag:412];
        tempView.image = [UIImage imageNamed:@"w_num_6"];
        tempView = (UIImageView *)[self.view viewWithTag:413];
        tempView.image = [UIImage imageNamed:@"w_num_7"];
        tempView = (UIImageView *)[self.view viewWithTag:414];
        tempView.image = [UIImage imageNamed:@"w_num_8"];
        _view_w_top.hidden = NO;
        _view_w_bottom.hidden =NO;
    }
    else
    {
        _view_w_bottom.hidden=YES;
        _view_w_top.hidden=YES;
    }
    m_click = !m_click;
    
}

- (IBAction)btn_goLastPage:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_checkIn:(id)sender
{
    /*
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"APP想取得您的FB資訊" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self performSegueWithIdentifier:@"segueCheckIn" sender:nil];
    }];
     
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    */
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
