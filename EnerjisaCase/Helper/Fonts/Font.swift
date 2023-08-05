//
//  Font.swift
//  EnerjisaCase
//
//  Created by Fatih on 3.08.2023.
//
import UIKit
final class Font {
    enum FontWeight {
        case Light
        case Regular
        case Medium
        case SemiBold
        case Bold
    }
    
    static func custom(size: CGFloat = 14, fontWeight: FontWeight = .Light) -> UIFont {
        return UIFont(name: "Hind-\(fontWeight)",
                      size: size * UIScreen.main.bounds.height * 0.00115)!
    }

    
}

