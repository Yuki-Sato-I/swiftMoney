//
//  ViewController.swift
//  OnboardApp
//
//  Created by 佐藤裕紀 on 2019/05/18.
//  Copyright © 2019 Yuki Sato. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    //説明文を入れた配列
    var onboardStringArray = ["私たちはみんな繋がっています。","どこからでも届けよう！","ショッピングモールにも","箱には楽しみがいっぱい","待っている人に最高の喜びを!"]
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    var animationArray = ["onboard1","onboard2","onboard3","onboard4","onboard5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        
        setUpScroll()
        
        //アニメーション
        
        for i in 0...4{
            let animationView = AnimationView()
            let animation = Animation.named(animationArray[i])
            animationView.frame = CGRect(x:CGFloat(i) * self.view.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
            
        }
        
    }


    func setUpScroll(){
        //scrollViewを貼り付ける
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height)
        
        for i in 0...4 {
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * self.view.frame.size.width, y: self.view.frame.size.height / 3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
            
        }
        
    }
}

