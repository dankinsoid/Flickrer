//
//  OAuth.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import Moya

extension Flickr.API {
    public enum Oauth {}
}

extension Flickr.API.Oauth {
    
    public struct RequestToken: FlickrAPIProtocol {
        public struct Input {}
        public struct Output {}
        public var method: Method { .get }
        public var input: Input { Input() }
        public var task: Task { .requestPlain }
        public func map(response: Response) throws -> Output { Output() }
    }
    
}
