//
//  PostView.m
//  Redditate
//
//  Created by Dave Gamache on 2/9/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "PostView.h"
#import "Post.h"

@implementation PostView

- (id)initWithFrame:(CGRect)frame AndPostData:(Post *)postData {
    self = [super initWithFrame:frame];
    if (self) {
        
        // Create the title view
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        titleView.lineBreakMode = NSLineBreakByWordWrapping;
        titleView.numberOfLines = 0;
        titleView.text = [postData title];
        [titleView setUserInteractionEnabled:NO];
        
        // Add the titleview as subview of postview
        [self addSubview:titleView];
        
        // Size the titleview inside the postview (basically to grab height)
        [titleView sizeToFit];
        
        // Reset rest of frame of title to inset it a bit for padding
        titleView.frame = CGRectMake(10, 0, 300, titleView.frame.size.height + 20);
        
        // Set frame of the actual postview to match height of titleview
        [self setFrame:CGRectMake(0, 0, 320, titleView.frame.size.height)];
        
    }
    return self;
}

@end
