//
//  PostFetcher.m
//  Redditate
//
//  Created by Dave Gamache on 2/6/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "PostFetcher.h"

@implementation PostFetcher

-(NSDictionary *)fetchHomepage {
    NSURL *url = [NSURL URLWithString:@"http://www.reddit.com/.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *responseError;
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:&responseError];
    NSError *parseError;
    NSDictionary *homeJSON = [NSJSONSerialization JSONObjectWithData:response
                                                        options:0
                                                          error:&parseError];
    
    if(responseError) {
        NSLog(@"Fetch failed: %@", [responseError localizedDescription]);
    } else if(parseError) {
        NSLog(@"Parse failed: %@", [parseError localizedDescription]);
    }
    
    return homeJSON;
    
}

@end
