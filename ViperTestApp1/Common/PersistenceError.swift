//
//  PersistenceError.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright © 2018年 Tomokatsu Iguchi. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case coundNotSaveObject
    case objectNotFound
}
