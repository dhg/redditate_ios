//
//  PostView.m
//  Redditate
//
//  Created by Dave Gamache on 2/9/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "PostView.h"
#import "Post.h"
#import "WebView.h"

@implementation PostView {
    NSString *currentLinkURL;
    float postHeight;
    UITextView *titleView;
}

- (id)initWithFrame:(CGRect)frame AndPostData:(Post *)postData {
    self = [super initWithFrame:frame];
    if (self) {
        
        // Title view
        [self createTitleView:[postData title]];
        
        // Image view if there is image
        if(![[postData thumbnail]  isEqual:@""]) {
            [self createImageView:[[postData url] mutableCopy]];
        }
        
        // Set postview frame
        [self setFrame:CGRectMake(0, 0, 320, postHeight)];
        
        
        currentLinkURL = [postData url];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTapped:)];
        [self addGestureRecognizer:tapGesture];
        
        
    }
    
    return self;
}

- (void)styleTitleView {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 6;
    titleView.attributedText = [[NSAttributedString alloc]
                                initWithString:@"Loading"
                                attributes:@{
                                             NSKernAttributeName: @(-0.1f),
                                             NSParagraphStyleAttributeName: style
                                             }];
    titleView.editable = NO;
    titleView.font = [UIFont fontWithName:@"AvenirLTStd-Light" size:18];
}

-(NSMutableString *)checkForIndirectImgurLink:(NSMutableString *)imageURL {
    if ([imageURL rangeOfString:@"imgur"].location != NSNotFound
        && [imageURL rangeOfString:@"jpg"].location == NSNotFound
        && [imageURL rangeOfString:@"gallery"].location == NSNotFound) {
//        imageURL = [[postData url] mutableCopy];
        [imageURL appendString:@".jpg"];
    }
    return imageURL;
}

-(void)createTitleView:(NSString *)title {
    titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 0)];
    [self styleTitleView];
    titleView.text = title;
    [self addSubview:titleView];
    [titleView sizeToFit];
    titleView.frame = CGRectMake(10, 15, 300, titleView.frame.size.height + 30);
    postHeight = titleView.frame.size.height;
}

-(void)createImageView:(NSMutableString *)imageURL {
    imageURL = [self checkForIndirectImgurLink:imageURL];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imageURL]];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    UIImageView *imagePreview = [[UIImageView alloc] initWithFrame:CGRectZero];
    if(image.size.width != 0) {
        float imageHeight = (290/image.size.width)*image.size.height;
        imagePreview.frame = CGRectMake(15, titleView.frame.size.height-15, 290, imageHeight);
        [imagePreview setImage:image];
        [self addSubview:imagePreview];
        postHeight = titleView.frame.size.height + imageHeight;
    }
}

- (void)titleTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    
}

@end