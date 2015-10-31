//
//  PostsTableViewController.swift
//  Redditate
//
//  Created by David Gamache on 10/29/15.
//  Copyright © 2015 David Gamache. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    var posts: JSON! = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableViewAutomaticDimension
        
        loadPosts()
        
    }
    
    func loadPosts() {
        RedditService.postsFromReddit() { (JSON) -> () in
            self.posts = JSON["data"]["children"]
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell")! as! PostTableViewCell
                
        cell.titleLabel.text = posts[indexPath.row]["data"]["title"].string!
        
        return cell
        
    }
    
}
