//
//  WebView.m
//  Redditate
//
//  Created by Dave Gamache on 2/23/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "WebView.h"

@implementation WebView

- (id)initWithFrame:(CGRect)frame {
    if (self) {
        [self setDelegate:self];
    }
    return self;
}

- (void)loadURL:(NSString *)urlAddress {
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self loadRequest:requestObj];
    self.frame = CGRectMake(0, 0, 320, 568);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
