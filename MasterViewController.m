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

@interface MasterViewController () {
    PostFetcher *homepageFetcher;
    PostParser *homepageParser;
    NSDictionary *postData;
    NSArray *posts;
    NSMutableArray *postViews;
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
    tableView.dataSource = self;
    tableView.delegate = self;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        [cell.contentView addSubview:postViews[indexPath.row]];
    }

    return cell;
}




@end
