//
//  PostParser.m
//  Redditate
//
//  Created by Dave Gamache on 2/6/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "PostParser.h"
#import "Post.h"

@implementation PostParser

-(NSArray *)createPostList:(NSDictionary *)postData {
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    NSMutableArray *formattedPosts = [[NSMutableArray alloc] init];
    posts = [[[postData valueForKey:@"data"] valueForKey:@"children"] valueForKey:@"data"];

    for (NSDictionary *postDictionary in posts) {
        Post *post = [[Post alloc] init];
        for (NSString *key in postDictionary) {
            if([post respondsToSelector:NSSelectorFromString(key)]) {
                [post setValue:[postDictionary valueForKey:key] forKey:key];
            }
        }
        [formattedPosts addObject:post];
    }
    return formattedPosts;
}

@end
