//
//  ViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[StoneSingleton shareSingletonObject].stoneArray];
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://192.168.2.197/temp/stone.php"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //NSLog(@"json: %@", json);
    //NSMutableDictionary *temparr = [json objectAtIndex:0];
    //NSLog(@"%@",[temparr objectForKey:@"name"]);
    /*
    for (NSMutableDictionary *tempArr in jsonArr)
    {
        NSLog(@"%@",[tempArr objectForKey:@"name"]);
    }
    */
    [StoneSingleton shareSingletonObject].stoneArray = jsonArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_entry:(id)sender {
}
@end
