//
//  Cover.swift
//  NationalGeography
//
//  Created by Asalah Sayed on 27/07/2023.
//

import Foundation

struct Cover: Identifiable{
    var id: Int
    var coverName: String
    var thumbnail: String {
        return "thumb-" + coverName
    }
    
}
