//
//  TextFields.swift
//  EmployeeSkillsTracker
//
//  Created by Ashlesha Kamble on 03/06/22.
//

import UIKit

class TextFields: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        customTextField()
    }
    
    func customTextField() {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .darkGray
        addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

}

extension UITextField {
    @IBInspectable var placeHolderColour: UIColor? {
        get {return self.placeHolderColour}
        set{self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor : newValue!])}
    }
}
