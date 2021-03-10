//
//  DynamicTextLayer.swift
//  SwiftChart
//
//  Created by Serhii Kostanian on 09.03.2021.
//

import Foundation

class ResizableTextLayer: CATextLayer {

    func sizeToFit() {
        guard let text = string as? String else { return }
        guard let font = font as? UIFont else { return }
        frame.size = text.lineSize(with: font)
    }
}

private extension String {

    func lineSize(with font: UIFont) -> CGSize {
        let size = CGSize(width: .greatestFiniteMagnitude, height: font.lineHeight)

        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]

        let rect = NSString(string: self).boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return CGSize(width: ceil(rect.width), height: ceil(rect.height))
    }
}
