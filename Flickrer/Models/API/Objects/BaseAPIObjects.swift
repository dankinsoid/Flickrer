//
//  BaseAPIObjects.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import Foundation

extension Flickr {
    public enum Objects {}
}

extension Flickr.Objects {
    
    public struct Request<T: Encodable>: Encodable {
        public var method: String
        public var format = Format.json
    }
    
    public enum Format: String, Codable {
        case json, xmlrpc, soap, php = "php_serial"
    }
    
}
