//
//  HorizontalAlignment+Utils.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 22/01/24.
//

import SwiftUI

extension HorizontalAlignment {
    struct HorizontalInfoAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.leading]
        }
    }

    static let horizontalInfoAlignment = HorizontalAlignment(HorizontalInfoAlignment.self)
}
