//
//  RedditService.swift
//  Redditate
//
//  Created by David Gamache on 10/30/15.
//  Copyright © 2015 David Gamache. All rights reserved.
//

import Alamofire

struct RedditService {
    
    private static let reqURL:String = "https://www.reddit.com/.json?limit=25&jsonp"
    
    static func postsFromReddit(returnData: (JSON) -> ()) {
        Alamofire.request(.GET, reqURL)
        .responseJSON { response in
            let json = JSON(data: response.data!)
            returnData(json)
        }
    }
    
    
}
