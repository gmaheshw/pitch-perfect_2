//
//  RecordedAudio.swift
//  pitch perfect
//
//  Created by Gautam Maheshwari on 19/05/15.
//  Copyright (c) 2015 Gautam Maheshwari. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    let filePathUrl: NSURL!
    let title: String!
    
    init(filePathUrl:NSURL,title:String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
}