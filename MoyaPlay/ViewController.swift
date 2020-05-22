//
//  ViewController.swift
//  MoyaPlay
//
//  Created by Rentaro on 2020/03/22.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let provider = MoyaProvider<AddressApi>()
        provider.request(.search(request: ["zipcode": "0310813"])) { result in
            switch result {
            case let .success(moyaResponse):
                let jsonData = try? JSONDecoder().decode(Address.self, from: moyaResponse.data)
                dump(jsonData!)
                
            case let .failure(error):
                print("アクセスに失敗しました:\(error)")
            }
        }
    }


}

