//
//  FKFlagView.swift
//  FlagKits
//
//  Created by Nguyen Minh on 3/29/17.
//  Copyright © 2017 LGKKTeam. All rights reserved.
//

import UIKit

let flagSheet = FKIcons.loadDefault()

open class FKFlagView: UIView {
    
    @IBOutlet fileprivate weak var flagImageView: UIImageView!
    @IBOutlet fileprivate weak var countryNameLabel: UILabel!
    @IBOutlet fileprivate weak var countryCodeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func getFlag(with code: String) -> UIImage? {
        if let flagSheet = FKIcons.sharedInstance.spriteSheet {
            return flagSheet.getImageFor(code)
        } else {
            return nil
        }
    }
    
    open func setup(country: Country) {
        if let countryCode = country.code {
            flagImageView.layer.borderWidth = 0.5
            flagImageView.layer.borderColor = UIColor.darkGray.cgColor
            flagImageView.layer.cornerRadius = 1
            flagImageView.layer.masksToBounds = true
            flagImageView.image = getFlag(with: countryCode)
        }
        countryNameLabel.text = country.name
        countryCodeLabel.text = country.phoneCode
    }
}
