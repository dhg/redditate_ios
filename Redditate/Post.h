//
//  Post.h
//  Redditate
//
//  Created by Dave Gamache on 2/6/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSNumber *num_comments;
@property (nonatomic) NSString *thumbnail;
@property (nonatomic) CGFloat *postHeight;

@end
