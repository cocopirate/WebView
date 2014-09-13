//
//  WebViewController.h
//  Prototype
//
//  Created by BitterBoy on 14-9-13.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate,UIAlertViewDelegate>
{
    NSURL *theURL;
    NSString *theTitle;
    IBOutlet UIWebView *webView;
    IBOutlet UINavigationItem *webTitle;
}

-(id)initWithURL:(NSURL *)url;
-(id)initWithURL:(NSURL *)url andTitle:(NSString *)string;
-(IBAction)done:(id)sender;

@end
