//
//  FlickrAPIProtocol.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import Moya
import VDCodable

public protocol FlickrAPIProtocol: TargetType {
    associatedtype PathRoot = Flickr.API
    associatedtype Input
    associatedtype Output
    func map(response: Response) throws -> Output
    var input: Input { get }
}

extension FlickrAPIProtocol {
    
    public var path: String {
        let string = String(reflecting: Self.self)
        let prefix = String(reflecting: PathRoot.self)
        let suffix = string.components(separatedBy: prefix).last ?? String(describing: Self.self)
        return suffix.components(separatedBy: ".").map({ $0.snakeCase }).joined(separator: "/").lowercased()
    }
    
    public var baseURL: URL { Flickr.API.baseURL }
    public var sampleData: Data { Data() }
    public var headers: [String: String]? { Flickr.API.baseHeaders }
//    public var task: Task { (try? map(input: input)) ?? .requestPlain }
}

extension FlickrAPIProtocol where Output: Decodable {
    
    
    
}

extension String {
    fileprivate var snakeCase: String { KeyEncodingStrategy.keyToSnakeCase(self, separator: "_") }
}

//fileprivate func decodeResponse<T: Decodable>(response: Response) throws -> T {
//    
//}
