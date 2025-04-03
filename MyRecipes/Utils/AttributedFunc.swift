//
//  AttributedFunc.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 26/03/25.
//

import Foundation

struct Utils {
    
    static func makeAttr(text: String, text1: String)  {
    }
}

let applicationDocumentsDirectory: URL = {
  let paths = FileManager.default.urls(
    for: .documentDirectory,
    in: .userDomainMask)
  return paths[0]
}()
