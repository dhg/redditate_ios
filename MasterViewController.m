//
//  MasterViewController.m
//  Redditate
//
//  Created by Dave Gamache on 2/6/14.
//  Copyright (c) 2014 Dave Gamache. All rights reserved.
//

#import "MasterViewController.h"
#import "PostFetcher.h"
#import "PostParser.h"
#import "PostView.h"
#import "WebView.h"
#import <QuartzCore/QuartzCore.h>

@interface MasterViewController () {
    PostFetcher *homepageFetcher;
    PostParser *homepageParser;
    NSDictionary *postData;
    NSArray *posts;
    NSMutableArray *postViews;
    WebView *webView;
}

@end

@implementation MasterViewController

- (instancetype)init {
    self = [super init];
    return self;
}

-(void)viewDidLoad {

    [super viewDidLoad];

    homepageFetcher = [[PostFetcher alloc] init];
    homepageParser =  [[PostParser alloc] init];
    postData =        [homepageFetcher fetchHomepage];
    posts =           [homepageParser createPostList:postData];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = tableView;
    tableView.layer.cornerRadius = 6.0f;
    tableView.layer.masksToBounds = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.08];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [posts count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostView *postView = [[PostView alloc] initWithFrame:CGRectZero AndPostData:posts[indexPath.row]];
    if(![postViews count]) {
        postViews = [[NSMutableArray alloc] init];
    }
    [postViews addObject:postView];
    return postView.frame.size.height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    [cell.contentView addSubview:postViews[indexPath.row]];
//    TODO: Need to reuse the cells with dequeueReusableCellWithIdentifier, but can't figure out how to get height right
    return cell;
}




@end
