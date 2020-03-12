//
//  FlickrAPI.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import Moya

public enum Flickr {
    
    public enum API {
        static let key = "4202e615543fd9f6d44b915178d66a04"
        static let secret = "58a2cb45acee3ff0"
        public static let baseURL = URL(string: "https://api.flickr.com/services/rest/")!
        public static let baseHeaders: [String: String] = [:]
    }
    
}
