//
//  CustomSwitch.swift
//  CustomSwitch
//
//  Created by hyku on 2018/2/11.
//  Copyright © 2018年 hyku. All rights reserved.
//

import UIKit

/// 开关点击事件
typealias SwitchValueChange = (Bool) -> ()

struct SwitchConfig {
    
    /// 关闭背景颜色
    var offBgColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.2)
    /// 打开背景颜色
    var onBgColor = UIColor(red: 70 / 255.0, green: 0 / 255.0, blue: 3 / 255.0, alpha: 1)
    
    /// 关闭圆点颜色
    var offPointColor = UIColor(red: 153 / 255.0, green: 153 / 255.0, blue: 153 / 255.0, alpha: 1)
    /// 打开圆点颜色
    var onPointColor = UIColor(red: 158 / 255.0, green: 0 / 255.0, blue: 6 / 255.0, alpha: 1)
    
    /// 背景View的上下边距
    var bgMargin: CGFloat = 7
    
    /// 圆点的上下边距
    var pointMargin: CGFloat = 5
}

class CustomSwitch: UIControl {

    /// 背景View
    var bgView: UIView!
    
    /// 开关圆点View
    var pointView: UIView!
    
    /// 配置
    var config: SwitchConfig!{
        didSet{
            self.updateUI()
        }
    }
    
    var  valueChangedHandle: SwitchValueChange?
    
    /// 开关状态
    var isOn: Bool!{
        didSet{
            if isOn {
                var frame: CGRect = self.pointView.frame
                frame.origin.x = self.bgView.frame.maxX - self.pointView.frame.width
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.bgView.backgroundColor = self.config.onBgColor
                    self.pointView.backgroundColor = self.config.onPointColor
                    self.pointView.frame = frame
                })
            } else {
                
                var frame: CGRect = self.pointView.frame
                frame.origin.x = self.bgView.frame.minX
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.bgView.backgroundColor = self.config.offBgColor
                    self.pointView.backgroundColor = self.config.offPointColor
                    self.pointView.frame = frame
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // 底部背景
        self.bgView = UIView()
        self.addSubview(self.bgView)
        self.bgView.layer.masksToBounds = true
        self.bgView.isUserInteractionEnabled = false
    
        // 开关按钮
        self.pointView = UIView()
        self.addSubview(self.pointView)
        self.pointView.layer.masksToBounds = true
        self.pointView.isUserInteractionEnabled = false

        self.isOn = false
        
        self.config = SwitchConfig()

        self.addTarget(self, action: #selector(self.stateChanges), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 布局
        self.bgView.frame = CGRect(x: 0, y: self.config.bgMargin, width: frame.width, height: frame.height - self.config.bgMargin * 2)
        
        let pointWidth = frame.height - self.config.pointMargin * 2
        self.pointView.frame = CGRect(x: self.bgView.frame.minX, y: self.config.pointMargin, width: pointWidth, height: pointWidth)
        
        self.updateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 响应事件
    @objc func stateChanges() {
        
        self.isOn = !self.isOn
        if self.valueChangedHandle != nil {
            self.valueChangedHandle!(self.isOn)
        }
    }
    
    /// 设置圆角和背景色
    func updateUI() {
        
        self.bgView.layer.cornerRadius = (self.frame.height - self.config.bgMargin * 2) * 0.5
        self.bgView.backgroundColor = self.config.offBgColor
        self.pointView.layer.cornerRadius = (self.frame.height - self.config.pointMargin * 2) * 0.5
        self.pointView.backgroundColor = self.config.offPointColor
    }
}
