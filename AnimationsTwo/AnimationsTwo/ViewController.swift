//
//  ViewController.swift
//  AnimationsTwo
//
//  Created by God on 10/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var animator: UIViewPropertyAnimator!
    private var animator2: UIViewPropertyAnimator!
    private var animator3: UIViewPropertyAnimator!
    private var animator4: UIViewPropertyAnimator!
    //MARK: UI Elements
    lazy var linearLabel: UIButton = {
        let button = UIButton()
        button.setTitle("Linear", for: .normal)
        button.setTitleColor(.white, for: .normal)
       button.addTarget(self, action: #selector(removeFallingManOne), for: .touchUpInside)
        button.backgroundColor = .systemPink
        return button
    }()
    
    lazy var easeInLabel: UIButton = {
        let button = UIButton()
         button.setTitle("Ease In", for: .normal)
        button.addTarget(self, action: #selector(removeFallingManTwo), for: .touchUpInside)
         button.setTitleColor(.white, for: .normal)
         button.backgroundColor = .systemPink
         return button
    }()
    
    lazy var easeOutLabel: UIButton = {
        let button = UIButton()
         button.setTitle("Ease Out", for: .normal)
         button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(removeFallingManThree), for: .touchUpInside);
        
        button.backgroundColor = .systemPink
         return button
    }()
    
    lazy var easeIneaseOut: UIButton = {
        let button = UIButton()
         button.setTitle("EaseInEaseOut", for: .normal)
         button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(removeFallingManFour), for: .touchUpInside);
        
        button.backgroundColor = .systemPink
         return button
    }()
    
    lazy var fallingManOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "falling-person-png-man-falling-down-115628892796mgp9scevk")
        return imageView
    }()
    
    lazy var fallingManTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "download")
        return imageView
    }()
    
    lazy var fallingManThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "9-90447_man-falling-png-man-falling-down-png-transparent")
        return imageView
    }()
    
    lazy var fallingManFour: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "download (1)")
        return imageView
    }()
    
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(startAnimations), for: .touchUpInside)
        button.backgroundColor = .systemPink
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(reverseAnimations), for: .touchUpInside)
        button.backgroundColor = .systemPink
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Clouds-iPhone-Wallpapers-Nature"))
        addSubViews()
        constraints()
        // Do any additional setup after loading the view.
    }


    //MARK: Private Functions
    @objc func removeFallingManOne() {
        fallingManOne.isHidden = true
    }
    @objc func removeFallingManTwo() {
        fallingManTwo.isHidden = true
    }
    @objc func removeFallingManThree() {
        fallingManThree.isHidden = true
    }
    @objc func removeFallingManFour()  {
        fallingManFour.isHidden = true
    }
    
    @objc func startAnimations() {
       animator = UIViewPropertyAnimator(duration: 2.0, curve: .linear, animations: {
        self.fallingManOne.transform = CGAffineTransform(translationX: 0, y: 500)
       })
        animator2 = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: {
         self.fallingManTwo.transform = CGAffineTransform(translationX: 0, y: 500)
        })
        animator3 = UIViewPropertyAnimator(duration: 2.0, curve: .easeOut, animations: {
         self.fallingManThree.transform = CGAffineTransform(translationX: 0, y: 500)
        })
        animator4 = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
         self.fallingManFour.transform = CGAffineTransform(translationX: 0, y: 500)
        })
        [animator,animator4,animator3,animator2].forEach({$0?.startAnimation()})
    }
    
    @objc func reverseAnimations() {
        animator = UIViewPropertyAnimator(duration: 2.0, curve: .linear, animations: {
         self.fallingManOne.transform = CGAffineTransform(translationX: 0, y: 0)
        })
         animator2 = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: {
          self.fallingManTwo.transform = CGAffineTransform(translationX: 0, y: 0)
         })
         animator3 = UIViewPropertyAnimator(duration: 2.0, curve: .easeOut, animations: {
          self.fallingManThree.transform = CGAffineTransform(translationX: 0, y: 0)
         })
         animator4 = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
          self.fallingManFour.transform = CGAffineTransform(translationX: 0, y: 0)
         })
         [animator,animator4,animator3,animator2].forEach({$0?.startAnimation()})
    }
    private func addSubViews() {
        let arrayOfElements = [linearLabel,easeInLabel,easeOutLabel,easeIneaseOut,fallingManOne,fallingManTwo,fallingManThree,fallingManFour,animateButton,resetButton]
    arrayOfElements.forEach({self.view.addSubview($0)})
    
    }
    
    private func constraints() {
        let arrayOfElements = [linearLabel,easeInLabel,easeOutLabel,easeIneaseOut,fallingManOne,fallingManTwo,fallingManThree,fallingManFour,animateButton,resetButton]
        arrayOfElements.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        //Labels
        [linearLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75),linearLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),linearLabel.heightAnchor.constraint(equalToConstant: CGFloat(50)),linearLabel.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        [easeInLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75),easeInLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor),easeInLabel.heightAnchor.constraint(equalToConstant: CGFloat(50)),easeInLabel.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        
        [easeOutLabel.topAnchor.constraint(equalTo: easeInLabel.topAnchor,constant: 15),easeOutLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 5),easeInLabel.heightAnchor.constraint(equalToConstant: CGFloat(50)),easeInLabel.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        
        [easeIneaseOut.topAnchor.constraint(equalTo: easeInLabel.topAnchor),easeIneaseOut.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),easeIneaseOut.heightAnchor.constraint(equalToConstant: CGFloat(50)),easeIneaseOut.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        
        //Images
        [fallingManOne.centerXAnchor.constraint(equalTo: linearLabel.centerXAnchor),fallingManOne.leadingAnchor.constraint(equalTo: linearLabel.leadingAnchor),fallingManOne.topAnchor.constraint(equalTo: linearLabel.bottomAnchor),fallingManOne.heightAnchor.constraint(equalToConstant: CGFloat(50)),fallingManOne.widthAnchor.constraint(equalToConstant: CGFloat(50))].forEach({$0.isActive = true})
        
        [fallingManTwo.centerXAnchor.constraint(equalTo: easeInLabel.centerXAnchor),fallingManTwo.leadingAnchor.constraint(equalTo: easeInLabel.leadingAnchor),fallingManTwo.topAnchor.constraint(equalTo: easeInLabel.bottomAnchor),fallingManTwo.heightAnchor.constraint(equalToConstant: CGFloat(50)),fallingManTwo.widthAnchor.constraint(equalToConstant: CGFloat(50))].forEach({$0.isActive = true})

        [fallingManThree.centerXAnchor.constraint(equalTo: easeOutLabel.centerXAnchor),fallingManThree.leadingAnchor.constraint(equalTo: easeOutLabel.leadingAnchor),fallingManThree.topAnchor.constraint(equalTo: easeOutLabel.bottomAnchor),fallingManThree.heightAnchor.constraint(equalToConstant: CGFloat(50)),fallingManThree.widthAnchor.constraint(equalToConstant: CGFloat(50))].forEach({$0.isActive = true})

     [fallingManFour.centerXAnchor.constraint(equalTo: easeIneaseOut.centerXAnchor),fallingManFour.leadingAnchor.constraint(equalTo: easeIneaseOut.leadingAnchor),fallingManFour.topAnchor.constraint(equalTo: easeIneaseOut.bottomAnchor),fallingManFour.heightAnchor.constraint(equalToConstant: CGFloat(50)),fallingManFour.widthAnchor.constraint(equalToConstant: CGFloat(50))].forEach({$0.isActive = true})
//
        
        [animateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),animateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: CGFloat(-50)),animateButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),animateButton.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        [resetButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -20),resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: CGFloat(-50)),resetButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),resetButton.widthAnchor.constraint(equalToConstant: CGFloat(100))].forEach({$0.isActive = true})
        
    }
    
    
    
    
    
}

