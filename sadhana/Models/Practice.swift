//
//  Practice.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-11.
//

import Foundation

enum PracticeType {
    case meditation
    case kirtan
}

struct Practice {
    let type: PracticeType
    var name: String
    var icon: String
    
    init(type: PracticeType) {
        self.type = type
        
        switch (type) {
        case PracticeType.meditation:
            name = "Meditation"
            icon = "meditation"
            break;
        case PracticeType.kirtan:
            name = "Kirtan"
            icon = "kirtan"
            break;
        }
    }
}
