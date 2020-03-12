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
        public var oauth_nonce: Int?
        public let format = Format.json
        public var oauthConsumerKey: String
        public var oauthTimestamp: Date                         //unixtime
        public let oauthSignatureMethod = SignatureMethod.sha1
        public let oauthVersion = 1
        public var oauthCallback: URL?
        public var oauthToken: String?
        public var oauthSignature: String?
    }
    
    public enum Format: String, Codable {
        case json, xmlrpc, soap, php = "php_serial"
    }
    
    public enum SignatureMethod: String, Codable {
        case sha1 = "HMAC-SHA1"
    }
    
}
