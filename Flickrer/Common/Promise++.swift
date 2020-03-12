//
//  Promise++.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import PromiseKit

extension Promise {
    
    public func await() throws -> T {
        var element: T?
        var error: Error?
        let semaphore = DispatchSemaphore(value: 0)
        done {
            element = $0
        }.ensure {
            semaphore.signal()
        }.catch {
            error = $0
        }
        semaphore.wait()
        if let err = error {
            throw err
        } else if element == nil {
            throw PMKError.emptySequence
        }
        return element!
    }
    
}

extension Guarantee {
    
    public func await() -> T {
        var element: T?
        let semaphore = DispatchSemaphore(value: 0)
        done {
            element = $0
            semaphore.signal()
        }
        semaphore.wait()
        return element!
    }
    
}
