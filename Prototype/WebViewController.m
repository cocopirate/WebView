//
//  WebViewController.m
//  Prototype
//
//  Created by BitterBoy on 14-9-13.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webTitle.title = theTitle;
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:theURL];
    [webView loadRequest:requestObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebView初始化（URL和标题）

- (id)initWithURL:(NSURL *)url andTitle:(NSString *)string
{
    if (self = [super init])
    {
        theURL = url;
        theTitle = string;
    }
    return self;
}

- (id)initWithURL:(NSURL *)url
{
    return [self initWithURL:url andTitle:nil];
}

#pragma mark - done按钮方法

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    webView.delegate = nil;
    [webView stopLoading];
}
#pragma mark - WebView开始载入方法

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

#pragma mark - WebView完成载入方法

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark - WebView载入失败方法

- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *errorString = [error localizedDescription];
    NSString *errorTitle = [NSString stringWithFormat:@"Error(%d)",error.code];
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:errorTitle message:errorString delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [errorView show];
}

#pragma mark - 出错时关闭模态视图

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
