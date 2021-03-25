//
//  Chart+Style.swift
//  SwiftChart_Example
//
//  Created by Serhii Kostanian on 11.03.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftChart

extension Chart {

    func applyStyle() {
        highlightMaskColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        highlightedChartIndex = 5
        hideHighlightOnTouchEnd = true
        highlightLineWidth = 1
        highlightLineColor = #colorLiteral(red: 0.3921568627, green: 0.4352941176, blue: 0.4745098039, alpha: 1)
        lineWidth = 5
        showXLabelsAndGrid = false
        showYLabelsAndGrid = true
        gridColor = .clear
        labelColor = #colorLiteral(red: 0.3921568627, green: 0.4352941176, blue: 0.4745098039, alpha: 1)
        labelFont = .systemFont(ofSize: 12, weight: .medium)
        highlightMetaInfoLabelColor = #colorLiteral(red: 0.3921568627, green: 0.4352941176, blue: 0.4745098039, alpha: 1)
    }
}
