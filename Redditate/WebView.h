//
//  WebView.h
//  Redditate
//
//  Created by Dave Gamache on 2/23/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebView : UIWebView <UIWebViewDelegate>

- (void)loadURL:(NSString *)urlAddress;

@end
