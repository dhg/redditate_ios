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
}

- (id)initWithFrame:(CGRect)frame AndPostData:(Post *)postData {
    self = [super initWithFrame:frame];
    if (self) {
        
        float postHeight;
        
        // Create the title view -------------------------------------------
        UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 0)];
        
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
        titleView.text = [postData title];
        
        
        // Add the titleview as subview of postview
        [self addSubview:titleView];
        
        // Size the titleview inside the postview (basically to grab height)
        [titleView sizeToFit];
        
        // Reset rest of frame of title to inset it a bit for padding
        titleView.frame = CGRectMake(10, 15, 300, titleView.frame.size.height + 30);
        
        postHeight = titleView.frame.size.height;
        
        // UI Image Part -------------------------------------------
        if(![[postData thumbnail]  isEqual:@""]) {
            
            NSMutableString *imageURL = [[postData url] mutableCopy];
        
            if ([[postData url] rangeOfString:@".jpg"].location != NSNotFound) {
                imageURL = [[postData url] mutableCopy];
            }
            if ([[postData url] rangeOfString:@".png"].location != NSNotFound) {
                imageURL = [[postData url] mutableCopy];
            }
            if ([[postData url] rangeOfString:@".gif"].location != NSNotFound) {
                imageURL = [[postData url] mutableCopy];
            }
            if ([[postData url] rangeOfString:@"imgur"].location != NSNotFound
                && [[postData url] rangeOfString:@"jpg"].location == NSNotFound
                && [[postData url] rangeOfString:@"gallery"].location == NSNotFound) {
                    imageURL = [[postData url] mutableCopy];
                    NSLog(@"%@", imageURL);
                    [imageURL appendString:@".jpg"];
            }
            
            
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

        [self setFrame:CGRectMake(0, 0, 320, postHeight)];
        
        currentLinkURL = [postData url];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTapped:)];
        [self addGestureRecognizer:tapGesture];
        
        
    }
    
    return self;
}

- (void)titleTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    
}

@end

//
//
////
////  PostView.m
////  Redditate
////
////  Created by Dave Gamache on 2/9/14.
////  Copyright (c) 2014 Dave Gamache. All rights reserved.
////
//
//#import "PostView.h"
//#import "Post.h"
//#import "WebView.h"
//
//@implementation PostView {
//    NSMutableData *imageData;
//    NSURLConnection *imageConnection;
//    float postHeight;
//}
//
//- (id)initWithFrame:(CGRect)frame AndPostData:(Post *)postData {
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        // Create the title view -------------------------------------------
//        UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 0)];
//        
//        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//        style.lineSpacing = 6;
//        titleView.attributedText = [[NSAttributedString alloc]
//                                    initWithString:@"Loading"
//                                    attributes:@{
//                                                 NSKernAttributeName: @(-0.1f),
//                                                 NSParagraphStyleAttributeName: style
//                                                 }];
//        titleView.editable = NO;
//        titleView.font = [UIFont fontWithName:@"AvenirLTStd-Light" size:18];
//        titleView.text = [postData title];
//        
//        
//        // Add the titleview as subview of postview
//        [self addSubview:titleView];
//        
//        // Size the titleview inside the postview (basically to grab height)
//        [titleView sizeToFit];
//        
//        // Reset rest of frame of title to inset it a bit for padding
//        titleView.frame = CGRectMake(10, 15, 300, titleView.frame.size.height + 30);
//        
//        postHeight = titleView.frame.size.height;
//        
//        // UI Image Part -------------------------------------------
//        if(![[postData thumbnail]  isEqual:@""]) {
//            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[postData thumbnail]]];
//            NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//            imageConnection = conn;
//        }
//        
//        [self setFrame:CGRectMake(0, 0, 320, postHeight)];
//        
//        //        currentLinkURL = [postData url];
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTapped:)];
//        [self addGestureRecognizer:tapGesture];
//        
//        
//    }
//    
//    return self;
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    [imageData appendData:data];
//}
//
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    
//    // set image with completed data
//    UIImage *image = [[UIImage alloc] initWithData:imageData];
//    
//    // create view to house image
//    UIImageView *imagePreview = [[UIImageView alloc] initWithFrame:CGRectZero];
//    
//    // calc/set frame of imageview
//    float imageHeight = (290/image.size.width)*image.size.height;
//    imagePreview.frame = CGRectMake(15, postHeight-15, 290, 300);
//    
//    // set image in imageview
//    [imagePreview setImage:image];
//    
//    // set new height to include image
//    postHeight += imagePreview.frame.size.height;
//    
//    // add imageview as subview of postview
//    [self addSubview:imagePreview];
//    
//    //set height of postview
//    [self setFrame:CGRectMake(0, 0, 320, postHeight)];
//}
//
//- (void)titleTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
//    
//}
//
//@end

