//
//  FKFlagHolderView.swift
//  FlagKits
//
//  Created by Nguyen Minh on 4/3/17.
//  Copyright © 2017 LGKKTeam. All rights reserved.
//

import UIKit
import Reusable

public protocol FKFlagHolderDelegate: class {
    func countryPhoneShouldReturn() -> Bool
}

open class FKFlagHolderView: UIView, NibOwnerLoadable {
    
    @IBOutlet fileprivate weak var btnFlag: UIButton!
    @IBOutlet fileprivate weak var lblPhoneCode: UILabel!
    @IBOutlet fileprivate weak var tfPhone: UITextField!
    
    open var backgroundPickerColor: UIColor? = .white
    
    open weak var delegate: FKFlagHolderDelegate?
    fileprivate var hiddenTfChooseCountry: UITextField?
    open var phoneCode: String? = "+1" // US default
    
    open var phone: String? {
        return tfPhone.text
    }
    
    open var fullPhone: String? {
        if let phoneCode = phoneCode, let text = tfPhone.text {
            return "\(phoneCode)\(text)"
        } else {
            return nil
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.loadNibContent()
        setUI()
    }
    
    init() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 30)
        super.init(frame: rect)
        
        self.loadNibContent()
        setUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadNibContent()
        setUI()
    }
    
    override open func becomeFirstResponder() -> Bool {
        return tfPhone.becomeFirstResponder()
    }
    
    func setUI() {
        backgroundColor = .clear
        tfPhone.delegate = self
        tfPhone.placeholder = "Phone number"
        tfPhone.keyboardType = .phonePad
        phoneCode = "+1"
        setFlag(with: "us")
    }
    
    fileprivate func setFlag(with code: String) {
        if let flagSheet = FKIcons.sharedInstance.spriteSheet {
            let image = flagSheet.getImageFor(code)
            btnFlag.setImage(image, for: .normal)
        }
    }
    
    @IBAction func btnFlag_Tapped(_ sender: Any) {
        endEditing(true)
        let screenWidth = UIScreen.main.bounds.width
        let countryPicker = FKFKCountryPicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 260))
        countryPicker.backgroundColor = backgroundPickerColor
        countryPicker.countryPhoneCodeDelegate = self
        countryPicker.setCountry(code: "us")
        
        // Trick:
        hiddenTfChooseCountry = UITextField()
        hiddenTfChooseCountry?.delegate = self
        if let hiddenTfChooseCountry = hiddenTfChooseCountry {
            addSubview(hiddenTfChooseCountry)
        }
        hiddenTfChooseCountry?.inputView = countryPicker
        hiddenTfChooseCountry?.becomeFirstResponder()
    }
    
    fileprivate func removeHiddenTf() {
        hiddenTfChooseCountry?.removeFromSuperview()
        hiddenTfChooseCountry = nil
    }
}

// MARK: - Country picker delegate
extension FKFlagHolderView: FKCountryPickerDelegate {
    func countryPhoneCodePicker(picker: FKFKCountryPicker,
                                didSelectCountryCountryWithName name: String,
                                countryCode: String,
                                phoneCode: String) {
        setFlag(with: countryCode)
        self.phoneCode = phoneCode
        lblPhoneCode.text = phoneCode
    }
}

// MARK: - UITextFieldDelegate
extension FKFlagHolderView: UITextFieldDelegate {
    // Pair becomeFirstResponder & countryPhoneShouldReturn
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let delegate = delegate, textField == tfPhone {
            return delegate.countryPhoneShouldReturn()
        }
        return true
    }
    
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        if textField == tfPhone, let text = textField.text {
            return text.characters.count + (string.characters.count - range.length) <= 15
        }
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        removeHiddenTf()
    }
}
