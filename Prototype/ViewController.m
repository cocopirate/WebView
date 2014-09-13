//
//  ViewController.m
//  Prototype
//
//  Created by BitterBoy on 14-9-13.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushedGo:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
    WebViewController *webViewController = [[WebViewController alloc] initWithURL:url andTitle:@"Apple"];
    [self presentViewController:webViewController animated:YES completion:nil];
}
@end
