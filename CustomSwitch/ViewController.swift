//
//  ViewController.swift
//  CustomSwitch
//
//  Created by hyku on 2018/2/11.
//  Copyright © 2018年 hyku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customSwitch: CustomSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customSwitch = CustomSwitch()
        self.view.addSubview(customSwitch)
        customSwitch.center = self.view.center
        customSwitch.bounds = CGRect(x: 0, y: 0, width: 40, height: 30)
        customSwitch.valueChangedHandle = {(isOn) in
            print(isOn)
        }
        
        var config = SwitchConfig()
        config.offBgColor = UIColor.red
        customSwitch.config = config
        
    }

}

