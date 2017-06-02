//
//  ViewController.swift
//  FlagKits
//
//  Created by nguyenminhkhmt@gmail.com on 05/30/2017.
//  Copyright (c) 2017 nguyenminhkhmt@gmail.com. All rights reserved.
//

import UIKit
import FlagKits
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var holder: FKFlagHolderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holder.backgroundPickerColor = .white
    }
}

