//
//  Address.swift
//  MoyaPlay
//
//  Created by Rentaro on 2020/03/22.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import Foundation

class Address: Codable {
    var message: String?
    var results: [Result]?
    var status: Int
}

struct Result: Codable {
    var address1: String
    var address2: String
    var address3: String
    var kana1: String
    var kana2: String
    var kana3: String
    var prefcode: String
    var zipcode: String
}
