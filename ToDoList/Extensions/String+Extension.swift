//
//  String+Extension.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 27.09.2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
