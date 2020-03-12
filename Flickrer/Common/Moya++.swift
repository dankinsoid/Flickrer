//
//  Moya++.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import Moya

extension TargetType {
    
    @discardableResult
    public func request(_ completion: @escaping (Result<Response, MoyaError>) -> ()) -> Cancellable {
        let provider = MoyaProvider<Self>()
        let owner = MoyaProviderOwner(provider)
        let cancel = provider.request(self) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
            owner.cancel()
        }
        return MoyaProviderCancellable(owner, cancel: cancel)
    }
}

fileprivate class MoyaProviderOwner<T: TargetType> {
    private var provider: MoyaProvider<T>?
    
    init(_ provider: MoyaProvider<T>) {
        self.provider = provider
    }
    
    func cancel() {
        provider = nil
    }
    
}

fileprivate class MoyaProviderCancellable<T: TargetType>: Cancellable {
    var isCancelled: Bool { cancellable.isCancelled }
    var cancellable: Cancellable
    var owner: MoyaProviderOwner<T>?
    
    init(_ provider: MoyaProviderOwner<T>, cancel: Cancellable) {
        cancellable = cancel
        owner = provider
    }
    
    func cancel() {
        cancellable.cancel()
        owner?.cancel()
        owner = nil
    }
    
}
