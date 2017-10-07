//
//  HomeViewController.swift
//  RxBasicInterface
//
//  Created by 陈恩湖 on 2017/9/9.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var themeTitleLabel: UILabel!
    @IBOutlet weak var coverImageViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adaptiveConfiguration()
    }

    fileprivate func adaptiveConfiguration() {
        //适配封面图的宽度（在 storyBoard 中宽度与高度成一比例，适配了宽度，高度也会跟着变化）
        coverImageViewWidthConstraint.constant = ScreenFeatureManager.shared.adapt(toDevice: .iPhone(inch35: 150, inch40: 250, inch47: 350, inch55: 420))
        
        // 适配不同的设备不同的封面图
        coverImageView.image = ScreenFeatureManager.shared.adapt(toDevice: .iPhone(inch35: UIImage(named: "home_adapt_inch35"), inch40: UIImage(named: "home_adapt_inch40"), inch47: UIImage(named: "home_adapt_inch47"), inch55: UIImage(named: "home_adapt_inch55")))
        
        //适配主题标题内容
        themeTitleLabel.text = ScreenFeatureManager.shared.adapt(toDevice: .iPhone(inch35: "杳无音迅（inch35）", inch40: "杳无音迅（inch40）", inch47: "杳无音迅（inch47）", inch55: "杳无音迅（inch55）"))

        //适配主题标题的字体样式
        themeTitleLabel.font = ScreenFeatureManager.shared.adapt(toDevice: .iPhone(inch35: UIFont.boldSystemFont(ofSize: 15), inch40: UIFont.boldSystemFont(ofSize: 18), inch47: UIFont.boldSystemFont(ofSize: 21), inch55: UIFont.boldSystemFont(ofSize: 25)))
        
        //适配主题标题的字体颜色
        themeTitleLabel.textColor = ScreenFeatureManager.shared.adapt(toDevice: .iPhone(inch35: UIColor.black, inch40: UIColor.gray, inch47: UIColor.lightGray, inch55: UIColor.green))

    }
}

