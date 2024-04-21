//
//  HorizontalAlignment+Utils.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
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
