//
//  LocalizedStrings.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 27.09.2021.
//

import Foundation

enum LocalizedStrings {
    enum Alert {
        static let title = "Error".localized
        static let admit = "OK".localized
    }
    
    enum DeleteAlert {
        static let title = "Delete Task".localized
        static let message = "Are you sure you'd like to delete the task?".localized
        static let cancel = "Cancel".localized
    }
    
    enum DeleteAction {
        static let delete = "Delete".localized
    }
}
