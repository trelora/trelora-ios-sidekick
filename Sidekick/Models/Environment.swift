//
//  Environment.swift
//  Sidekick
//
//  Created by Rolly Sarmiento on 11/28/17.
//  Copyright © 2017 Rolly Sarmiento. All rights reserved.
//

import Foundation

class Environment: NSObject, NSCoding {

    var name:           String
    var apiHost:        String
    var webHost:      String
    
    enum Key: String {
        case name = "name"
        case apiHost = "apiHost"
        case webHost = "webHost"
    }
    
    init(name: String, apiHost: String, webHost: String) {
        self.name = name
        self.apiHost = apiHost
        self.webHost = webHost
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: Key.name.rawValue) as? String ?? ""
        self.apiHost = aDecoder.decodeObject(forKey: Key.apiHost.rawValue) as? String ?? ""
        self.webHost = aDecoder.decodeObject(forKey: Key.webHost.rawValue) as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Key.name.rawValue)
        aCoder.encode(apiHost, forKey: Key.apiHost.rawValue)
        aCoder.encode(webHost, forKey: Key.webHost.rawValue)
    }
    
}
