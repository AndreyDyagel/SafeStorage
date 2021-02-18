//
//  Model.swift
//  SafeStorage
//
//  Created by Андрей on 22.01.2021.
//


import UIKit

enum DataType: Int {
    case folder = 0
    case image
}

struct ProfileData {
    var name: String
    var type: DataType
}
