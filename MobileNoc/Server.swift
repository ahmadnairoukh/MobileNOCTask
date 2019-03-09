//
//  Server.swift
//  MobileNoc
//
//  Created by AhmadNero on 3/1/19.
//  Copyright © 2019 AhmadNero. All rights reserved.
//

import Foundation

struct Content: Decodable {
    let content: [Server]
}

struct Server: Decodable {
    let name: String
    let ipAddress: String
    let ipSubnetMask: String?
    let status: Status
}

struct Status: Decodable {
    let id: Int
}
