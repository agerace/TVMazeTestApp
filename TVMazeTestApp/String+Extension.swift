//
//  String+Extension.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 10/05/2025.
//

import Foundation

extension String {
    func stripHTML() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html
        ]
        let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        return attributedString?.string ?? self
    }
}
