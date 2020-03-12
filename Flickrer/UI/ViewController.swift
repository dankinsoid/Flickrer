//
//  ViewController.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import UIKit

public final class ViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        print(Flickr.API.Oauth.RequestToken().path)
    }

}

